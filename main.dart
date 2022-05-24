import 'package:flutter/material.dart';
import 'package:city_app/screens/profilepage.dart';
import 'package:city_app/screens/loginpage.dart';

void main() {
  runApp(const MyApp());
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route : (context) => const LoginPage(),
        ProfilePage.route : (context) => const ProfilePage(),
      },
    );
  } //build
}//MyApp
