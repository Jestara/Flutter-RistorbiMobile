import 'package:flutter/material.dart';
import 'package:ristorbi/Widgets/AppBarWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _userName, _password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(24.0),
      child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image:
                      'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/102010/redskins_scriptr.png?itok=0nqvpXaW',
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  // validator: validateUserName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_outlined),
                    hintText: 'Kullanıcı Adı',
                    labelText: 'Kullanıcı Adı',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _userName = value,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  obscureText: true,
                  // validator: validatePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: 'Şifre',
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => _password = value,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RaisedButton.icon(
                        color: Colors.amber,
                        icon: Icon(Icons.save),
                        label: Text('Giriş'),
                        onPressed: () => login(),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    ));
  }

  String validateUserName(String userName) {
    if (userName.length <= 0) {
      return 'Lütfen kullanıcı adınızı giriniz';
    } else {
      return null;
    }
  }

  String validatePassword(String password) {
    if (password.length <= 0) {
      return 'Lütfen şifrenizi  giriniz';
    } else {
      return null;
    }
  }

  void login() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint('Kullanıcı Adı : $_userName  Şifre : $_password');
      Navigator.pushNamed(context, '/home');
    }
  }
}
