import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _login() {

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyAppScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _login,
          child: Text('Login'),
        ),
      ),
    );
  }
}