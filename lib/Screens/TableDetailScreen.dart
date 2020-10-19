import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ristorbi/Models/Table.dart';
import 'package:ristorbi/Screens/ProductListScreen.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';

class TableDetailScreen extends StatefulWidget {
  @override
  _TableDetailScreenState createState() => _TableDetailScreenState();
}

class _TableDetailScreenState extends State<TableDetailScreen> {
  int _buttomNavigationSelectedIndex = 0;

  Widget build(BuildContext context) {


    final TableModel table = ModalRoute.of(context).settings.arguments;
    Widget _onItemTapped(int index) {
      setState(() {
        _buttomNavigationSelectedIndex = index;
      });
      if(index == 1)
        {
         Navigator.pushNamed(context, '/products', arguments: table);
        }
      else if(index == 2){
        _showMyDialog(context);
      }
    }

    return Scaffold(
      appBar: AppBarWidget(
        leading: IconButton(icon: Icon(Icons.backspace),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text(
          table.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _buttomNavigationSelectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AnaSayfa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_rounded),
              backgroundColor: Colors.amber,
              label: 'Sipariş Al'),
             BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet,
                color: Colors.red,
              ),
              backgroundColor: Colors.teal,
              label: 'Adisyon'),
        ],
      ),
      body: Center(
        child: RaisedButton(child: Text('ShowAlertDialog'),onPressed: (){
          _showMyDialog(context);
        },),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Adisyon basılıcak emin misiniz ?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Bu işlemi yaptığınızda;'),
              Text('Masa oturumu kapatılacak ve adisyon yazılıcak'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('İptal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),TextButton(
            child: Text('Devam'),
            onPressed: () {
              debugPrint('Alert Dialog Clicked');
            },
          )
        ],
      );
    },
  );
}
