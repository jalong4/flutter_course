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

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        image: AssetImage('assets/background.jpg'));
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _buildAcceptTermsSwitch() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: SwitchListTile(
        value: _acceptTerms,
        title: Text('Accept Terms'),
        onChanged: (bool value) {
          setState(() {
            _acceptTerms = value;
          });
        },
      ),
    );
  }

  void _submitForm() {
    print('Email: ' + _email);
    print('Password: ' + _password);
    print('Accept Terms: ' + (_acceptTerms ? 'true' : 'false'));
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double width =  deviceWidth > 550.0 ? 400.0 : deviceWidth * 0.95;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(image: _buildBackgroundImage()),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: width,
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(height: 10.0),
                  _buildPasswordTextField(),
                  SizedBox(height: 10.0),
                  _buildAcceptTermsSwitch(),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 40.0,
                    width: width,
                    child: RaisedButton(
                      child: Text('Login'),
                      textColor: Colors.white,
                      onPressed: _submitForm))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
