import 'package:im_stepper/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:city_app/database/database.dart';
import 'package:city_app/repository/databaseRepository.dart';


import 'package:city_app/screens/profilepage.dart';
import 'package:city_app/screens/loginpage.dart';
import 'package:city_app/screens/exploreCities.dart';
import 'package:city_app/screens/stopsCities.dart';

import 'package:city_app/screens/stepsPage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //This is a special method that use WidgetFlutterBinding to interact with the Flutter engine.
  //This is needed when you need to interact with the native core of the app.
  //Here, we need it since when need to initialize the DB before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);

  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));

  //runApp(const MyApp());

  //main
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.route,
      routes: {
        LoginPage.route: (context) => LoginPage(),
        ProfilePage.route: (context) => ProfilePage(),
        StepsPage.route: (context) => StepsPage(),
        ExploreCities.route: (context) => ExploreCities(),
        IconStepperDemos.route:(context) => IconStepperDemos(),
      },
    );
  } //build
} //MyApp
