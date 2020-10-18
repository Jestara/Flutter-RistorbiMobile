import 'package:flutter/material.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';
import 'package:ristorbi/Widgets/DrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBarWidget(
        title: Text(
          'Anasayfa',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'Ana Sayfa',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }


}
