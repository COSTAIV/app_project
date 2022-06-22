import 'package:city_app/utils/client_info.dart';
import 'package:flutter/material.dart';
import 'package:city_app/screens/loginpage.dart';
import 'package:city_app/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'Profilepage';

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
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                _toLoginPage(context);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final sp = await SharedPreferences.getInstance();
                if (sp.getString('userId') == null)
                {
                // Authorize the app se non lhai gia fatto 
                String? userId = await FitbitConnector.authorize(
                    context: context,
                    clientID: ClientInfo.fitbitClientID,
                    clientSecret: ClientInfo.fitbitClientSecret,
                    redirectUri: ClientInfo.fitbitRedirectUri,
                    callbackUrlScheme: ClientInfo.fitbitCallbackScheme);
                
                final sp = await SharedPreferences.getInstance();
                sp.setString('userId', userId!);
                }
               
                  String? userId = sp.getString('userId');
                  print(userId);    //check 
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

                

                double lastweek_steps = 0;
                for (var i = 0; i < stepsData. length; i++) {
                    lastweek_steps += stepsData[i].value!;
                  }

                // Use them as you want
                final snackBar = SnackBar(
                  
                    content: Text(
                        'Last week you walked ${lastweek_steps} steps!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                _toHomePage(context);
                
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
          ],
        ),
      ),
    );
  } //build

  void _toLoginPage(BuildContext context) async {
    //Unset the 'username' filed in SharedPreference
    final sp = await SharedPreferences.getInstance();
    sp.remove('logged');

    //Pop the drawer first
    //Navigator.pop(context);        funziona correttemente senza a me ..., al prof va messa 
    //Then pop the ProfilePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  }
  void _toHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomePage.route);
  }
} //ProfilePage
