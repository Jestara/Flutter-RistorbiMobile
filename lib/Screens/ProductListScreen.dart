import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ristorbi/Blocs/Category/category_bloc.dart';
import 'package:ristorbi/Blocs/Category/category_state.dart';
import 'package:ristorbi/Blocs/Category/category_event.dart';
import 'package:ristorbi/Blocs/Product/product_bloc.dart';
import 'package:ristorbi/Blocs/Product/product_event.dart';
import 'package:ristorbi/Models/Category.dart';
import 'package:ristorbi/Models/Product.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';
import 'package:ristorbi/Widgets/CategoryItem.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  int selectedCategoryId;
  int selectedIndex;
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TableModel table = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBarWidget(
          title: Text(
            '${table.name} İçin Ürünler',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            // ignore: missing_return
            BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
              if (state is CategoryInitial) {
                final categoryBloc = context.bloc<CategoryBloc>();
                categoryBloc.add(CategoryEvent.getCategories);
              } else if (state is CategoryLoadingState) {
                return Center(child: CircularProgressIndicator());
                // ignore: missing_return
              } else if (state is CategoryLoadedState) {
                final categories = state.categories;
                return buildCategoriesWidgets(context, categories);
              } else if (state is CategoryErrorState) {
                return Center(
                  child: Text('Categoryler getirilemedi '),
                );
              }
            }) // ignore: missing_return
            ,
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.center,
              width: size.width,
              height: size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<ProductBloc, ProductState>(
                        // ignore: missing_return
                        builder: (context, state) {
                      if (state is ProductInitial) {
                        return Center(
                          child: Text('Lütfen Kategori Seçiniz'),
                        );
                      } else if (state is ProductLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ProductLoadedState) {
                        final products = state.products;
                        return buildProductWidgets(
                            selectedCategoryId, context, products);
                      } else if (state is ProductErrorState) {
                        return Center(
                          child: Text('ÜRÜNLER GETİRİLEMEDİ !!'),
                        );
                      }
                    })
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildProductWidgets(
      int categoryId, BuildContext context, List<Product> products) {
    return Center(child: Text(products[0].name));
  }

  buildCategoriesWidgets(BuildContext context, List<Category> categories) {
    print(categories[0].name);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return InkWell(
            onTap: () {},
            child: CategoryItem(
              title: categories[index].name,
              isActive: selectedIndex == index ? true : false,
              press: () {
                setState(() {
                  selectedIndex = index;
                });
                selectedCategoryId = categories[index].id;
                final _productBloc = context.bloc<ProductBloc>();
                _productBloc.add(
                    GetProductByCategoryId(categoryId: selectedCategoryId));
              },
            ),
          );
        }),
      ),
    );
  }
}
