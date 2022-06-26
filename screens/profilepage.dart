import 'package:city_app/database/entities/dayinfos.dart';
import 'package:city_app/database/entities/yeasterdaysleep.dart';
import 'package:city_app/utils/client_info.dart';
import 'package:flutter/material.dart';
import 'package:city_app/screens/loginpage.dart';
import 'package:city_app/screens/stepsPage.dart';
import 'package:city_app/screens/sleepPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:provider/provider.dart';
import 'package:city_app/repository/databaseRepository.dart';
import 'package:floor/floor.dart';


import 'package:syncfusion_flutter_charts/charts.dart'; ////////////////////
import 'package:intl/intl.dart'; ////////////////////



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'Profilepage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(ProfilePage.routename),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(90.0),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.facciabuco.com/grafica/vignette/preview_big/futurama-fry.jpg'),
              ),
              accountEmail: Text(''),
              accountName: Text(''),
              decoration: BoxDecoration(
                color: Color.fromARGB(177, 44, 100, 212),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bed),
              title: const Text(
                'Sleep',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                _tosleepPage(context);
                title:
                'Sleep';
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_walk),
              title: const Text(
                'Steps',
                style: TextStyle(fontSize: 24.0),
              ),
              onTap: () {
                _tostepsPage(context);
                title:
                'Steps';
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              //foregroundColor: Color.fromARGB(176, 234, 237, 243),
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://www.facciabuco.com/grafica/vignette/preview_big/futurama-fry.jpg'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nicknameController,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 40.0),
                /*prefixIcon: Icon(
                    Icons.person,
                    size: 12,
                    color: Colors.white,
                  ),*/
                hintText: 'Edit your nickname',
                hintStyle: TextStyle(
                  color: Color.fromARGB(137, 211, 19, 19),
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder(
              future: SharedPreferences.getInstance(),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  final sp = snapshot.data as SharedPreferences;
                  if (sp.getDouble('week_steps') == null) {
                    sp.setDouble('week_steps', 0);
                    return Text('Last week you walked 0 steps !');
                  } else {
                    return Text(
                        'Last week you walked ${sp.getDouble('week_steps')} steps !');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              }),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                _toLoginPage(context);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                //final sp = await SharedPreferences.getInstance();
                //if (sp.getString('userId') == null) {     cambia logica perche expires il token mi sa ...
                // Authorize the app se non lhai gia fatto
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

                //fetchare dati sonno ////

                FitbitSleepDataManager fitbitSleepDataManager =
                    FitbitSleepDataManager(
                  clientID: ClientInfo.fitbitClientID,
                  clientSecret: ClientInfo.fitbitClientSecret,
                );

                FitbitSleepAPIURL fitbitSleepAPIURL =
                    FitbitSleepAPIURL.withUserIDAndDateRange(
                  startDate: DateTime.now().subtract(Duration(days: 8)),
                  endDate: DateTime.now().subtract(Duration(days: 1)),
                  userID: userId,
                );

                //List<FitbitSleepAPIURL> fitbitSleepAPIURL = await fitbitSleepDataManager.fetch(fitbitSleepAPIURL);  nel sito prof
                final sleepData = await fitbitSleepDataManager
                    .fetch(fitbitSleepAPIURL) as List<FitbitSleepData>;
                //final response = await getResponse(fitbitSleepAPIURL);

                //trovo durata in minuti del sonno nelle varie giornate
                DateTime current_day =
                    DateTime.now().subtract(Duration(days: 1));
                current_day = DateUtils.dateOnly(current_day);
                final yeasterday = current_day;

                //riempimento database (magari mettilo sottoforma di funzione da chiamare)
                DateTime lim_inf = sleepData[0].entryDateTime!;
                DateTime lim_sup = sleepData[0].entryDateTime!;
                num minutes_of_sleep = 0;
                int k = 0;
                double lastweek_steps = 0;
                double lastweek_sleep = 0;

                for (var i = 0; i < sleepData.length - 2; i++) {
                  if (DateUtils.dateOnly(sleepData[i].dateOfSleep!) ==
                          current_day &&
                      DateUtils.dateOnly(sleepData[i + 1].dateOfSleep!) !=
                          current_day) {
                    lim_sup = sleepData[i].entryDateTime!;
                    minutes_of_sleep = (lim_sup.millisecondsSinceEpoch -
                            lim_inf.millisecondsSinceEpoch) /
                        60000;
                    lastweek_steps += stepsData[k].value!;
                    lastweek_steps += minutes_of_sleep;
                    print(minutes_of_sleep);
                    Day_infos newdayinfos = Day_infos(
                      stepsData[6 - k].dateOfMonitoring!.millisecondsSinceEpoch,
                      stepsData[6 - k].dateOfMonitoring!,
                      stepsData[6 - k].value!,
                      minutes_of_sleep.toDouble(),
                    ); //devo essere sicuro che non sono null

                    //print (newdaysteps);
                    await Provider.of<DatabaseRepository>(context,
                            listen: false)
                        .insertDayInfos(newdayinfos);

                    k = k + 1;

                    ///salva in memoria minuti con data
                    lim_inf = sleepData[i + 1].entryDateTime!;
                    current_day = current_day.subtract(Duration(days: 1));
                  }

                  if (DateUtils.dateOnly(sleepData[i].dateOfSleep!) ==
                      yeasterday) {
                    Yeasterday_sleep newyeasterday = Yeasterday_sleep(
                      sleepData[i].entryDateTime!.millisecondsSinceEpoch,
                      DateTime.now().subtract(Duration(days: 1)),
                      sleepData[i].level!,
                      sleepData[i].entryDateTime!,
                    );
                    print (i);
                    //inserisco primo per discorso indici
                    await Provider.of<DatabaseRepository>(context,
                            listen: false)
                        .insertYeasterdaySleep(newyeasterday);
                  }
                }

                setState(() {
                  sp.setDouble('week_steps', lastweek_steps);
                });
                setState(() {
                  sp.setDouble('week_sleep', lastweek_sleep);
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
              //style: ,
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
                _deleteInfosTable(context);
              },
              child: Text('Tap to delete the content of the database'),
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
    sp.remove('email');

    //Pop the drawer first
    //Navigator.pop(context);        funziona correttemente senza a me ..., al prof va messa
    //Then pop the ProfilePage
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  }

  void _deleteInfosTable(BuildContext context) async {
    final data = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllDayInfos() as List<Day_infos>;
    for (var i = 0; i < data.length; i++) {
      await Provider.of<DatabaseRepository>(context, listen: false)
          .removeDayInfos(data[i]);
    }
    final data_yeasterdaysleep =
        await Provider.of<DatabaseRepository>(context, listen: false)
            .findAllYeasterdaySleep() as List<Yeasterday_sleep>;
    for (var i = 0; i < data_yeasterdaysleep.length; i++) {
      await Provider.of<DatabaseRepository>(context, listen: false)
          .removeYeasterdaySleep(data_yeasterdaysleep[i]);
    }
    final sp = await SharedPreferences.getInstance();
    setState(() {
      sp.remove('week_steps');
      sp.remove('week_sleep');
    });
  }

  void _tostepsPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(StepsPage.route);
  }

  void _tosleepPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(SleepPage.route);
  }
} //ProfilePage
