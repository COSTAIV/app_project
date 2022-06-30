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
import 'package:city_app/screens/sleepPage.dart';
import 'package:city_app/screens/riddlePage.dart';
import 'package:city_app/screens/settingsPage.dart';

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
} //main

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.route,
      theme: new ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        // Define the default font family.
        fontFamily: 'Georgia',
        // Define the default `TextTheme`.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      routes: {
        LoginPage.route: (context) => LoginPage(),
        ProfilePage.route: (context) => ProfilePage(),
        StepsPage.route: (context) => StepsPage(),
        SleepPage.route: (context) => SleepPage(),
        ExploreCities.route: (context) => ExploreCities(),
        IconStepperDemos.route: (context) => IconStepperDemos(),
        RiddlePage.route: (context) => RiddlePage(),
        SettingsPage.route: (context) => SettingsPage(),
      },
    );
  } //build
} //MyApp
