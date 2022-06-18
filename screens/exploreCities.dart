import 'package:flutter/material.dart';

class ExploresCities extends StatelessWidget {
  ExploresCities({Key? key}) : super(key: key);

  static const route = '/exploreCities/';
  static const routename = 'ExploresCities';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore cities'),
        ),
        body: _exploreCity(),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              onPressed: () {
                
              },
              child: Text('An option'),
              ),
              ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Another option'),
              ),
            ],
          ),
        ),
      ),
    );
  } //build

  //Returns the ListView as
  Widget _exploreCity() => ListView(
        children: [
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text('Padova'),
            subtitle: Text('The city unlocks with at least 27500 steps'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text('Paris'),
            subtitle: Text('The city unlocks with at least 75300 steps'),
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text('Ciudad de México'),
            subtitle: Text('The city unlocks with at least 161400 steps'),
            trailing: Icon(Icons.arrow_right),
          ),
        ],
      );
} //ExploresCities