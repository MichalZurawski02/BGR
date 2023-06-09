import 'package:boardgames/pages/login_page.dart';
import 'package:flutter/material.dart';
import '../widgets/my_buttons.dart';
import '../widgets/my_text_field.dart';
import 'package:boardgames/firebase_access_object.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final FirebaseDAO firebaseDAO = FirebaseDAO();
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user up method
  Future<void> signUserUp(context) async {
    try {
      await firebaseDAO.postUser(usernameController.text, passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage())
      );      
    }
    catch (e) {
      _showDialog(context);
    }
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registration failed'),
          content: const Text('The username has already been taken.'),
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
          
                const Icon(
                  Icons.casino_rounded,
                  size: 50,
                  color: Colors.blue
                ),
          
                const SizedBox(height: 30),
          
                Text(
                  'Register now',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 46,
                      fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  'Please enter your credentials:',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  )
                ),
          
                const SizedBox(height: 15),
          
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
                RegisterButtonBig(
                  onTap: () => signUserUp(context),
                ),
          
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'or go back and',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GoBackToLogButton(onTap: (){
                      Navigator.of(context).pop();
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