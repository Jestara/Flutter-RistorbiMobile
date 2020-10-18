import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ristorbi/Blocs/Area/area_bloc.dart';
import 'package:ristorbi/Blocs/Category/category_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'package:ristorbi/Repository/TableRepository.dart';
import 'package:ristorbi/Screens/HomeScreen.dart';
import 'package:ristorbi/Screens/LoginScreen.dart';
import 'package:ristorbi/Screens/ProductListScreen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<TableBloc>(create: (context) => TableBloc()),
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
        BlocProvider<AreaBloc>(create: (context) => AreaBloc()),
      ],
      child: MaterialApp(
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
          '/tableDetail': (context) => TableDetailScreen(),
          '/settings': (context) => SettingScreen(),
          '/products': (context) => ProductListScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}

//
