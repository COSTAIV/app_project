<<<<<<< HEAD
//anna
=======
>>>>>>> master

import 'package:flutter/material.dart';
import 'package:city_app/screens/profilepage.dart';
import 'package:city_app/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
<<<<<<< HEAD
} //main
=======
<<<<<<< HEAD
<<<<<<< HEAD
}
=======
}//main
>>>>>>> bac84b9b4967e415f54035fb67505537f3241777
>>>>>>> master

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  } //build
}//MyApp
<<<<<<< HEAD
=======
>>>>>>> bac84b9b4967e415f54035fb67505537f3241777
=======
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            initialRoute: LoginPage.route,
            routes: {
              LoginPage.route: (context) => LoginPage(),
              ProfilePage.route: (context) => ProfilePage(),
            },
          );
  } //build
}//MyApp
>>>>>>> 163409462579e8cc57dfbf216959720ce066f865
>>>>>>> master
