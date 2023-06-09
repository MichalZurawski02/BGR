import 'package:flutter/material.dart';
import 'signup_page.dart';
import '../widgets/my_buttons.dart';
import '../widgets/my_text_field.dart';
import '../main.dart';
import 'package:boardgames/firebase_access_object.dart';

import 'package:boardgames/globals.dart' as globals;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final FirebaseDAO firebaseDAO = FirebaseDAO();
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  Future<void> signUserIn(context) async {
    try {
      if (await firebaseDAO.authUser(
              usernameController.text, passwordController.text) ==
          true) {
        globals.username = usernameController.text;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyAppScreen()));
      }
      else { 
        _showDialog(context);
      }
    } catch (e) {
      _showDialog(context);
    }
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login failed'),
          content: const Text('Incorrect username or password. Please try again.'),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK', 
                style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                )),
              ),
          ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(Icons.casino_rounded, size: 50, color: Colors.blue),

                const SizedBox(height: 30),

                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 45),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 35),

                // sign in button
                LogInButton(onTap: () {
                  signUserIn(context);
                }),

                const SizedBox(height: 90),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    RegisterButton(onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
