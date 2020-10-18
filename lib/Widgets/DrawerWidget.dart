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
          UserAccountsDrawerHeader(
            accountName: Text('Ersen Koçak'),
            currentAccountPicture: Image.network(
                'https://cdn4.iconfinder.com/data/icons/avatars-21/512/avatar-circle-human-male-2-512.png'),
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
                  onTap: () => navigate(context, '/tableDetail'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Ayarlar'),
                  onTap: () => navigate(context, '/setting'),
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
