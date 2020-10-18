import 'package:flutter/material.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final TableModel table = ModalRoute.of(context).settings.arguments;
    debugPrint('PRODUCT SCREEN ARG--> ${table.name}');
    return Scaffold(
      appBar: AppBarWidget(
        title: Text('${table.name} İçin Ürünler',style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
