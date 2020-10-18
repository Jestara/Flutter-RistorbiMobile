import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'package:ristorbi/Repository/TableRepository.dart';
import 'package:ristorbi/Screens/HomeScreen.dart';
import 'package:ristorbi/Screens/LoginScreen.dart';
import 'package:ristorbi/Screens/SettingScreen.dart';
import 'package:ristorbi/Screens/TableDetailScreen.dart';
import 'package:ristorbi/Service/TableService.dart';
import 'package:ristorbi/locator.dart';

import 'Blocs/Table/table_state.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.red),
        fontFamily: 'Montserrat',
        primaryColor: Colors.teal,
      ),
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/tableDetail': (context) => BlocProvider(create: (context) => TableBloc(),child: TableDetailScreen()),
        '/setting': (context) => SettingScreen(),
      },
      initialRoute: '/tableDetail',
    );
  }
}

