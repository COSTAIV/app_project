


import 'package:flutter/material.dart';

class ExploresCities extends StatelessWidget {
  ExploresCities({Key? key}) : super(key: key);

  static const route = '/exploreCities/';
  static const routename = 'ExploresCities';

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx =context;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore cities',
          style: TextStyle(color: Colors.white),),
          backgroundColor: Color.fromARGB(255, 48, 41, 255).withOpacity(0.8),
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
              ElevatedButton(
              onPressed: () {
                _toHomePage(context);
              },
              child: Text('Back to HomePage'),
              ),
            ],
          ),
        ),
      ),
    );
   //build
  } 
 
  //Returns the ListView as
  Widget _exploreCity() => ListView(
    
        children: [
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text('Padova', style: TextStyle(color: Colors.black, fontSize: 20),),
            subtitle: Text('The city unlocks with at least 27500 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                _toStopsCities(ctx); //QUI DA ERRORE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text('Paris', style: TextStyle(color: Colors.black, fontSize: 20),),
            subtitle: Text('The city unlocks with at least 75300 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                               
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text('Ciudad de México', style: TextStyle(color: Colors.black, fontSize: 20),),
            subtitle: Text('The city unlocks with at least 161400 steps', style: TextStyle(color: Colors.grey),),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 48, 41, 255),        
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                                
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),      
            ),
          ),
        ],
      );
  

      
  void _toStopsCities(BuildContext ctx){
    Navigator.pushNamed(ctx, '/stops/');
  }

  void _toHomePage(BuildContext context) {
    Navigator.pop(context, '/homePage/');
  }
      
} //ExploresCities