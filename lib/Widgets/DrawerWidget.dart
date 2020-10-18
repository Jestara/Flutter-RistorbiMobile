import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DrawerHeader(
            // accountName: Text('Ersen Koçak',style: TextStyle(fontSize: 18.0),),
            // currentAccountPicture: Image.network(
            //     'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-2-512.png'),
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.teal,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInImage.assetNetwork(
                      width: 100,
                      height: 100,
                      placeholder: 'assets/loading.gif',
                      image:
                          "https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-2-512.png"),
                  Text(
                    'Ersen Koçak',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Anasayfa'),
                  onTap: () => navigate(context, '/home'),
                ),
                ListTile(
                  leading: Icon(Icons.table_chart),
                  title: Text('Masa Detay'),
                  // onTap: () => navigate(context, '/tableDetail'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Ayarlar'),
                  onTap: () => navigate(context, '/settings'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void navigate(BuildContext context, String url) {
  if (url != null) {
    Navigator.pushNamed(context, url);
  }
}
