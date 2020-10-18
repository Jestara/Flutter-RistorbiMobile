import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_bloc.dart';
import 'package:ristorbi/Blocs/Table/table_event.dart';
import 'package:ristorbi/Blocs/Table/table_state.dart';
import 'package:ristorbi/Models/Table.dart';
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
      body: BlocBuilder<TableBloc, TableState>(builder: (context, state) {
        if (state is TableInitial) {
          final tableBloc = context.bloc<TableBloc>();
          tableBloc.add(TableEvents.getTables);
          return Text('');

        } else if (state is TableLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TableLoadedState) {
          final tables = state.tables;
          return buildTableWidgets(context, tables);
        }
      }),
    );
  }
}
buildTableWidgets(BuildContext context, List<TableModel> tables) {
  return GridView.count(
    padding: EdgeInsets.all(16.0),
    crossAxisCount: 3,
    children: List.generate(tables.length, (index) {
      return InkWell(
        onTap: (){
          navigateTableDetail(context,tables[index]);
        },
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/table.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(tables[index].name)
            ],
          ),
        ),
      );
    }),
  );
}

void navigateTableDetail(BuildContext context,TableModel table) {
  debugPrint('TIKLANAN TABLE ${table.name}');
  Navigator.pushNamed(context, '/tableDetail',arguments: table);
}

