import 'package:city_app/database/entities/daysteps.dart';
import 'package:city_app/repository/databaseRepository.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:city_app/screens/exploreCities.dart';
import 'package:city_app/screens/profilePage.dart';

//HomePage can be Steless. Only the ListView content changes, not the HomePage by itself.
class StepsPage extends StatelessWidget {
  StepsPage({Key? key}) : super(key: key);

  static const route = '/stepsPage/';
  static const routename = 'StepsPage';

  @override
  Widget build(BuildContext context) {
    print('${StepsPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(StepsPage.routename),
      ),

      //menù laterale

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
                _toExploresCities(context);
              },
              child: Text('Explore Cities'),
            ),
            ElevatedButton(
              onPressed: () {
                _toProfilePage(context);
              },
              child: Text('Back to profile page'),
            ),
          ],
        ),
      ),

      //The FAB is used to add random entries to the Todo table
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
          },
          child: Icon(Icons.add)),

      body: Center(
        child:
            
            //To do so, we use a Consumer of DatabaseRepository in order to rebuild the widget tree when
            //entries are deleted or created.
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          //The logic is to query the DB for the entire list of Todo using dbr.findAllTodos()
          //and then populate the ListView accordingly.
          //We need to use a FutureBuilder since the result of dbr.findAllTodos() is a Future.
          return FutureBuilder(
            initialData: null,
            future: dbr.findAllDaySteps(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List<Day_steps>;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, stepsIndex) {
                      final daysteps = data[stepsIndex];
                      return Card(
                        elevation: 5,
                        //Here we use a Dismissible widget to create a nicer UI.
                        child: Dismissible(
                          //Just create a dummy unique key
                          key: UniqueKey(),
                          //This is the background to show when the ListTile is swiped
                          background: Container(color: Colors.red),
                          //The ListTile is used to show the Todo entry
                          child: ListTile(
                            leading: Icon(MdiIcons.note),
                            title: Text('${daysteps.dateTime}'),
                            subtitle: Text('You walked ${daysteps.d_steps} !'),
                            //If the ListTile is tapped, it is deleted
                          ),
                          //This method is called when the ListTile is dismissed
                          onDismissed: (direction) async {
                            //No need to use a Consumer, we are just using a method of the DatabaseRepository
                            await Provider.of<DatabaseRepository>(context,
                                    listen: false)
                                .removeDaySteps(daysteps);
                          },
                        ),
                      );
                    });
              } else {
                //A CircularProgressIndicator is shown while the list of Todo is loading.
                return CircularProgressIndicator();
              } //else
            }, //builder of FutureBuilder
          );
        }),
      ),
    );
  } //build

 
} //StepsPage


  void _toExploresCities(BuildContext context) {
    Navigator.pushNamed(context, '/exploreCities/');
  }

 void _toProfilePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ProfilePage.route);
  } //_toProfilePage