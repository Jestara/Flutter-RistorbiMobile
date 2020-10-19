import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ristorbi/Models/Product.dart';
import 'package:ristorbi/Repository/ProductRepository.dart';
import 'package:ristorbi/locator.dart';

import 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository = locator<ProductRepository>();

  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {

    if(event is GetProductByCategoryId){
      yield ProductLoadingState();
      try {
        print('BLOC PRODUCTS -->');
        final products = await _productRepository.getProductsByCategoryId(event.categoryId);


        yield ProductLoadedState(products: products);
      } catch (error){
        print(error);
        yield ProductErrorState();
      }
    }
  }
}
