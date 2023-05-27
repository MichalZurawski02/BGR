import 'package:boardgames/firebase_access_object.dart';
import 'package:boardgames/pages/favourites/favourites_page.dart';
import 'package:boardgames/pages/home/home_page.dart';
import 'package:boardgames/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animations/animations.dart';
import 'pages/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

FirebaseDAO firebaseDAO = FirebaseDAO();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFAFAFA),
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class MyAppScreen extends StatefulWidget {
  @override
  _MyAppScreenState createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions =
  <Widget>[
    FavouritePage(),
    HomePage(),
    UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
