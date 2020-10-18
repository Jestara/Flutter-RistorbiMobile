import 'package:flutter/material.dart';
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_event.dart';
import 'package:ristorbi/Blocs/Table/table_state.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Repository/TableRepository.dart';
import 'package:ristorbi/Service/TableService.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableDetailScreen extends StatefulWidget {
  @override
  _TableDetailScreenState createState() => _TableDetailScreenState();
}

class _TableDetailScreenState extends State<TableDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TableBloc, TableState>(
            builder: (context, state) {
              if (state is TableInitial) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Initial Data'),
                      RaisedButton(child: Text('Tıkla'), onPressed: () {
                        final tableBloc = context.bloc<TableBloc>();
                        tableBloc.add(TableEvents.getTables);
                      })
                    ],
                  ),
                );
              } else if (state is TableLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TableLoadedState) {
                final tables = state.tables;
                return Center(
                  child: Text(tables[1].name),
                );

            }
            }));
  }
}

buildTableWidgets(BuildContext context, var tables) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: tables.map((table) => Text(table.name))),
  );
}

// GridView.count(
// crossAxisCount: 3,
// padding: EdgeInsets.all(16.0),
// children: tables.map((table) => return Card(
// elevation: 4,
// child: Container(
// child: Column(
// children: [
// Expanded(child:
// Container(
// child: (
// AssetImage('assets/table.jpg'),
// ),
// )),
// Text(table.name),
// ],
// ),
// ),
// ) )
