import 'package:flutter/cupertino.dart';
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
      appBar: AppBarWidget(
        title: Text('Masa Detay',style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Text('Masa Detay'),
      ),
    );
  }
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
