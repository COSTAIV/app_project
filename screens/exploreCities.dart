import 'package:flutter/material.dart';
import 'package:city_app/models/City.dart';
import 'package:city_app/models/Stop.dart';
import 'package:city_app/screens/profilepage.dart';
import 'package:city_app/screens/riddlePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreCities extends StatelessWidget {
  ExploreCities({Key? key}) : super(key: key);

  static const route = '/exploreCities/';
  static const routename = 'ExploresCities';

  late BuildContext ctx;
  double? n;

  List<City> list_cities = [
    Venezia,
    Roma,
    Padova,
    NewYork,
    Paris,
    London,
    CiudadDeMexico
  ];

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore cities',
          style: TextStyle(color: Colors.white),
          textScaleFactor: 0.9,
        ),
        backgroundColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
        leading: IconButton(
            onPressed: () {
              _toProfilePage(context);
            },
            icon: Icon(Icons.arrow_back_rounded)),
      ),
      body: _exploreCity(),
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: Color.fromARGB(176, 255, 255, 255).withOpacity(0.8),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(RiddlePage.route);
        },
        child: FutureBuilder(
                    future: SharedPreferences.getInstance(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final sp = snapshot.data as SharedPreferences;
                        if (sp.getBool('riddle_answer') == true) 
                        {return Icon(Icons.lock_open);}
                        else
                        {
                          return Icon(Icons.lock);
                        }}else {
                        return CircularProgressIndicator();
                      }}),
      ),
    ),);
    //build
  }

  //Returns the ListView as
  Widget _exploreCity() => FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final sp = snapshot.data as SharedPreferences;
            if (sp.getDouble('week_steps') == null) {
              sp.setDouble('week_steps', 0);
              n = 0;
            } else {
              n = sp.getDouble('week_steps');
            }
            return ListView.builder(
              itemCount: list_cities.length,
              itemBuilder: (context, Index) {
                final city = list_cities[Index];
                return Card(
                  //The ListTile is used to show the Todo entry
                  child: ListTile(
                    leading: Icon(Icons.flight_takeoff_rounded),
                    title: Text(
                      '${list_cities[Index].name}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      '${list_cities[Index].min_steps!.toStringAsFixed(0)} weekly steps to unlock',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: () async {
                        final sp = await SharedPreferences.getInstance();
                        if (n! >= list_cities[Index].min_steps! || sp.getBool('riddle_answer') == true) {
                          _toStopsCities(ctx, list_cities[Index]);
                        } else {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.grey.shade400,
                              content: Text(
                                  'Not enough steps !', textAlign: TextAlign.center,));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      label: Text('Visit'),
                      icon: Icon(Icons.navigate_next_outlined),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        }),
      );
  /*
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Venezia',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 8700 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 8700) {
                  _toStopsCities(ctx, Venezia);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Roma',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 17000 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 17000) {
                  _toStopsCities(ctx, Roma);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Padova',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 27500 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 27500) {
                  _toStopsCities(ctx, Padova);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'New York',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 47800 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 47800) {
                  _toStopsCities(ctx, NewYork);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Paris',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 75300 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary:Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 75300) {
                  _toStopsCities(ctx, Paris);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'London',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 105500 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 105500) {
                  _toStopsCities(ctx, London);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
          ListTile(
            leading: Icon(Icons.flight_takeoff_rounded),
            title: Text(
              'Ciudad de México',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            subtitle: Text(
              'The city unlocks with at least 161400 steps',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                if (n! >= 161400) {
                  _toStopsCities(ctx, CiudadDeMexico);
                } else {}
              },
              label: Text('Visit'),
              icon: Icon(Icons.navigate_next_outlined),
            ),
          ),
        ],
      );*/

  void _toStopsCities(BuildContext ctx, City city) {
    Navigator.pushNamed(ctx, '/stops/', arguments: city);
    print('Going to ${city.name}');
  }

  void _toProfilePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ProfilePage.route);
  }
}
