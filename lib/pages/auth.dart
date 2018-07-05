import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email = '';
  String _password = '';
  bool _acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SwitchListTile(
              value: _acceptTerms,
              title: Text('Accept Terms'),
              onChanged: (bool value) {
                setState(() {
                  _acceptTerms = value;
                });
              },
            ),
            SizedBox(height: 10.0),
            RaisedButton(
                child: Text('Login'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  print('Email: ' + _email);
                  print('Password: ' + _password);
                  print('Accept Terms: ' + (_acceptTerms ? 'true' : 'false'));
                  Navigator.pushReplacementNamed(context, '/products');
                })
          ],
        ),
      ),
    );
  }
}
