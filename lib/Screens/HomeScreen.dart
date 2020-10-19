import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ristorbi/Blocs/Area/area_bloc.dart';
import 'package:ristorbi/Blocs/Area/area_event.dart';
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_event.dart';
import 'package:ristorbi/Blocs/Table/table_state.dart';
import 'package:ristorbi/Models/Area.dart';
import 'package:ristorbi/Models/Category.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';
import 'package:ristorbi/Widgets/CategoryItem.dart';
import 'package:ristorbi/Widgets/DrawerWidget.dart';
import 'package:ristorbi/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int selectedIndex = 0;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, length: 2, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(
        title: Text(
          'Anasayfa',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: missing_return
          BlocBuilder<AreaBloc, AreaState>(builder: (context, state) {
            if (state is AreaInitial) {
              final areaBloc = context.bloc<AreaBloc>();
              areaBloc.add(AreaEvent.getAreas);
              return Text('');
            } else if (state is AreaLoadingState) {
              return Text('');
            } else if (state is AreaLoadedState) {
              final areas = state.areas;
              return buildAreasWidgets(context, areas);
            } else if (state is AreaErrorState) {
              return Center(
                child: Text('Areas Getirilemedi'),
              );
            }
          }),
          Expanded(
            child:
                // ignore: missing_return
                BlocBuilder<TableBloc, TableState>(builder: (context, state) {
              if (state is TableInitial) {
                final tableBloc = context.bloc<TableBloc>();
                tableBloc.add(TableEvents.getTables);
                return Text('');
              } else if (state is TableLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TableLoadedState) {
                final tables = state.tables;
                return buildTableWidgets(context, tables);
              } else if (state is TableErrorState) {
                return Center(
                  child: Text('Bağlantı Sağlanamadı'),
                );
              }
              ;
            }),
          )
        ],
      ),
    );
  }

  buildAreasWidgets(BuildContext context, List<Area> areas) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(areas.length, (index) {
          return InkWell(
            onTap: () {},
            child: CategoryItem(
              title: areas[index].name,
              isActive: selectedIndex == index ? true : false,
              press: () {
                setState(() {
                  selectedIndex = index;
                });
                print(areas[index].id);
              },
            ),
          );
        }),
      ),
    );
  }

  buildTableWidgets(BuildContext context, List<TableModel> tables) {
    return GridView.count(
      padding: EdgeInsets.all(16.0),
      crossAxisCount: 3,
      children: List.generate(tables.length, (index) {
        return InkWell(
            onTap: () {
              navigateTableDetail(context, tables[index]);
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/table.jpg',
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(tables[index].name)
                    ],
                  ),
                  Positioned(
                      height: 20,
                      width: 20,
                      right: 1,
                      top: 1,
                      child: CircleAvatar(
                        backgroundColor:
                        tables[index].status ? Colors.teal : Colors.red,
                      ))
                ],
              ),
            ));
      }),
    );
  }

  void navigateTableDetail(BuildContext context, TableModel table) {
    debugPrint('TIKLANAN TABLE ${table.name}');
    Navigator.pushNamed(context, '/tableDetail', arguments: table);
  }


}
