import 'package:flutter/material.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';
class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Text('Ayarlar'),

      ),
    );
  }
}
