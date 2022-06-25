import 'package:city_app/database/entities/daysteps.dart';
import 'package:city_app/utils/client_info.dart';
import 'package:flutter/material.dart';
import 'package:city_app/screens/loginpage.dart';
import 'package:city_app/screens/stepsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:provider/provider.dart';
import 'package:city_app/repository/databaseRepository.dart';
import 'package:floor/floor.dart';
//import 'package:city_app/database/typeConverters/dateTimeConverter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'Profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(ProfilePage.routename),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                  final sp = snapshot.data as SharedPreferences;
                  if(sp.getDouble('week_steps') == null)
                  {
                      sp.setDouble('week_steps', 0);
                      return Text ('Last week you walked 0 steps !');
                  }
                  else
                  {
                    return Text ('Last week you walked ${sp.getDouble('week_steps')} steps !');
                  }
                }
                else{
                  return CircularProgressIndicator();
                }
              }),
            ),

            //poi farai un future builder per il sonno 
            
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                _toLoginPage(context);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: ClientInfo.fitbitClientID,
                    clientSecret: ClientInfo.fitbitClientSecret,
                    redirectUri: ClientInfo.fitbitRedirectUri,
                    callbackUrlScheme: ClientInfo.fitbitCallbackScheme);

                final sp = await SharedPreferences.getInstance();
                sp.setString('userId', userId!);
                //}

                String? user_id = sp.getString('userId');
               
                //Instantiate a proper data manager
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: ClientInfo.fitbitClientID,
                  clientSecret: ClientInfo.fitbitClientSecret,
                  type: 'steps',
                );

                //Fetch step data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.weekWithResource(
                  baseDate: DateTime.now().subtract(Duration(days: 1)),
                  userID: userId,
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;



                //riempimento database con passi
                double lastweek_steps = 0;
                //DateTime _selectedDate;
                for (var i = 0; i < stepsData.length; i++) {
                  //print (stepsData.length);
                  lastweek_steps += stepsData[i].value!;
                  /*print (stepsData[i]
                          .dateOfMonitoring);
                  print (stepsData[i].value);*/

                  // _selectedDate =

                  Day_steps newdaysteps = Day_steps(stepsData[i].dateOfMonitoring!.millisecondsSinceEpoch,
                    stepsData[i].dateOfMonitoring!,
                    stepsData[i].value!,
                  ); //devo essere sicuro che non sono null
                  //print (newdaysteps);
                  await Provider.of<DatabaseRepository>(context,
                          listen: false)
                      .insertDaySteps(newdaysteps);
                   
                }
                setState(() {
                  sp.setDouble('week_steps', lastweek_steps);
                });

                // Use them as you want
                final snackBar = SnackBar(
                    content:
                        Text('Last week you walked ${lastweek_steps} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text('Tap to synchronize your data'),
            ),
            ElevatedButton(
              onPressed: () async {
                await FitbitConnector.unauthorize(
                  clientID: ClientInfo.fitbitClientID,
                  clientSecret: ClientInfo.fitbitClientSecret,
                );
                final sp = await SharedPreferences.getInstance();
                sp.remove('userId');
              },
              child: Text('Tap to unauthorize'),
            ),
            ElevatedButton(
              onPressed: () async {
                _deleteStepsTable(context);
              },
              child: Text('Tap to delete the content of the database'),
            ),
            ElevatedButton(
              onPressed: () async {
                _tostepsPage(context);
              },
              child: Text('to steps page'),
            ),
          ],
        ),
      ),
    );
  } 
 //build
  void _toLoginPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('logged');

    //Pop the drawer first
    //Navigator.pop(context);        funziona correttemente senza a me ..., al prof va messa
    //Then pop the ProfilePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  }

  void _deleteStepsTable(BuildContext context) async {
    final data = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllDaySteps() as List<Day_steps>;
    for (var i = 0; i < data.length; i++) {
      await Provider.of<DatabaseRepository>(context, listen: false)
          .removeDaySteps(data[i]);
    }
    final sp = await SharedPreferences.getInstance();
    setState(() {
    sp.remove('week_steps');
    });
  }

  void _tostepsPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(StepsPage.route);
  }
} //ProfilePage
