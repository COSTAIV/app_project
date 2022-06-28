import 'dart:ffi';

import 'package:city_app/database/entities/dayinfos.dart';
import 'package:city_app/database/entities/yesterdaysleep.dart';
import 'package:city_app/utils/client_info.dart';
import 'package:flutter/material.dart';
import 'package:city_app/screens/loginpage.dart';
import 'package:city_app/screens/stepsPage.dart';
import 'package:city_app/screens/sleepPage.dart';
import 'package:city_app/screens/exploreCities.dart';
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
  final _tooltipBehavior = TooltipBehavior(enable: true);
  bool loading_flag = false;

  @override
  void initState() {
    loading_flag = false;
    super.initState();
  } // initState

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
          title: Text(ProfilePage.routename, textScaleFactor: 0.9),
          backgroundColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
          actions: <Widget>[
            loading_flag == true
                ? Container(
                    margin: EdgeInsets.all(10),
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Color.fromARGB(255, 24, 202, 30),
                      strokeWidth: 5,
                    ),
                  )
                : SizedBox(),
            Padding(padding: EdgeInsets.only(right: 25.0)),
            Padding(
                padding: EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  onTap: () async {
                    _deleteInfosTable(context);
                  },
                  child: Icon(
                    Icons.delete,
                    size: 26.0,
                  ),
                )),
          ]),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 200,
                    alignment: Alignment.topLeft,
                    child: Column(children: [
                      SizedBox(height: 25),
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(
                            'https://www.facciabuco.com/grafica/vignette/preview_big/futurama-fry.jpg'),
                      ),
                    ]),
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
                  ListTile(
                    leading: const Icon(Icons.explore),
                    title: const Text(
                      'Explore cities',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    onTap: () {
                      _toExploreCities(context);
                      title:
                      'Explore cities';
                    },
                  ),
                  SizedBox(height: 280),
                  ListTile(
                    leading: const Icon(Icons.block),
                    title: const Text(
                      'Unauthorize',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    onTap: () async {
                      await FitbitConnector.unauthorize(
                        clientID: ClientInfo.fitbitClientID,
                        clientSecret: ClientInfo.fitbitClientSecret,
                      );
                      final sp = await SharedPreferences.getInstance();
                      sp.remove('userId');
                      title:
                      'Unauthorize';
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    onTap: () {
                      _toLoginPage(context);
                      title:
                      'Logout';
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              //foregroundColor: Color.fromARGB(176, 234, 237, 243),
              radius: 85,
              backgroundImage: NetworkImage(
                  'https://www.facciabuco.com/grafica/vignette/preview_big/futurama-fry.jpg'),
            ),
            SizedBox(height: 10),
            Container(
              //height: MediaQuery.of(context).size.height * 1 / 10,
              //width: MediaQuery.of(context).size.width * 3 / 5,
              height: 50,
              width: 320,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff424242),
                      Color.fromARGB(177, 44, 100, 212),
                    ]),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  FutureBuilder(
                    future: SharedPreferences.getInstance(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final sp = snapshot.data as SharedPreferences;
                        if (sp.getDouble('week_steps') == null) {
                          sp.setDouble('week_steps', 0);
                          return Text('Last week you walked 0 steps !',
                              style: TextStyle(
                                  fontSize: 16.0, fontStyle: FontStyle.italic));
                        } else {
                          double? n = sp.getDouble('week_steps');
                          return Text(
                              'Last week you walked ${sp.getDouble('week_steps')} steps !',
                              style: TextStyle(
                                  fontSize: 16.0, fontStyle: FontStyle.italic));
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              //height: MediaQuery.of(context).size.height * 1 / 10,
              //width: MediaQuery.of(context).size.width * 3 / 5,
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff424242),
                      Color.fromARGB(177, 44, 100, 212),
                    ]),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  FutureBuilder(
                    future: SharedPreferences.getInstance(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final sp = snapshot.data as SharedPreferences;
                        if (sp.getDouble('week_sleep') == null) {
                          sp.setDouble('week_sleep', 0);
                          return Text('Last week you slept 0 hurs !',
                              style: TextStyle(
                                  fontSize: 16.0, fontStyle: FontStyle.italic));
                        } else {
                          return Text(
                              'Last week you slept ${(sp.getDouble('week_sleep')! / (7 * 60)).toStringAsFixed(2)} hours on average !',
                              style: TextStyle(
                                  fontSize: 16.0, fontStyle: FontStyle.italic));
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 320,
              height: 320,
              child:
                  Consumer<DatabaseRepository>(builder: (context, dbr, child) {
                return FutureBuilder(
                  initialData: null,
                  future: dbr.findAllYesterdaySleep(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as List<Yesterday_sleep>;
                      List<_PieData>? piedata = [
                        _PieData('light', 0),
                        _PieData('deep', 0),
                        _PieData('rem', 0),
                        _PieData('wake', 0)
                      ];

                      int cont_light = 0;
                      int cont_deep = 0;
                      int cont_rem = 0;
                      int cont_wake = 0;

                      //////////////riempimento della lista
                      for (var i = 0; i < data.length; i++) {
                        if (data[i].level == 'light') {
                          cont_light++;
                        }
                        if (data[i].level == 'deep') {
                          cont_deep++;
                        }
                        if (data[i].level == 'rem') {
                          cont_rem++;
                        }
                        if (data[i].level == 'wake') {
                          cont_wake++;
                        }
                      }

                      piedata[0].yData = (cont_light * 30) / 60;
                      piedata[1].yData = (cont_deep * 30) / 60;
                      piedata[2].yData = (cont_rem * 30) / 60;
                      piedata[3].yData = (cont_wake * 30) / 60;

                      cont_light = 0;
                      cont_deep = 0;
                      cont_rem = 0;
                      cont_wake = 0;

                      return SfCircularChart(
                        title: ChartTitle(
                            text: 'Yesterday sleep',
                            textStyle: TextStyle(
                                fontSize: 26.0, fontStyle: FontStyle.italic)),
                        legend: Legend(isVisible: true),
                        borderColor: Color.fromARGB(177, 44, 100, 212),
                        borderWidth: 1.0,
                        tooltipBehavior: _tooltipBehavior,
                        series: <PieSeries<_PieData, String>>[
                          PieSeries<_PieData, String>(
                              explode: true,
                              explodeIndex: 0,
                              name: 'sleep',
                              dataSource: piedata,
                              xValueMapper: (_PieData pie_data, _) =>
                                  pie_data.xData,
                              yValueMapper: (_PieData pie_data, _) =>
                                  pie_data.yData / 60, //dato in ore
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false),
                              dataLabelMapper: (_PieData data, _) => data.text,
                              enableTooltip: true)
                        ],
                      );
                    } else {
                      //A CircularProgressIndicator is shown while the list of Todo is loading.
                      return CircularProgressIndicator();
                    } //else
                  }, //builder of FutureBuilder
                );
              }),
            ),
            SizedBox(height: 10),
            Container(
              //height: MediaQuery.of(context).size.height * 1 / 10,
              //width: MediaQuery.of(context).size.width * 3 / 5,
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff424242),
                      Color.fromARGB(177, 44, 100, 212),
                    ]),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(""),
                  const Text("Synchronize your data",
                      style: TextStyle(
                          fontSize: 20.0, fontStyle: FontStyle.normal)),
                  SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff0277BD)),
                      child: IconButton(
                        icon: Icon(Icons.sync),
                        iconSize: 25.0,
                        color: Colors.green,
                        onPressed: () async {
                          _synchronize(context);
                        },
                      )),
                ],
              ),
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
    setState(() {
      loading_flag = true;
    });
    final data = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllDayInfos() as List<Day_infos>;
    for (var i = 0; i < data.length; i++) {
      await Provider.of<DatabaseRepository>(context, listen: false)
          .removeDayInfos(data[i]);
    }
    final data_yeasterdaysleep =
        await Provider.of<DatabaseRepository>(context, listen: false)
            .findAllYesterdaySleep() as List<Yesterday_sleep>;
    for (var i = 0; i < data_yeasterdaysleep.length; i++) {
      await Provider.of<DatabaseRepository>(context, listen: false)
          .removeYesterdaySleep(data_yeasterdaysleep[i]);
    }
    final sp = await SharedPreferences.getInstance();
    setState(() {
      loading_flag = false;
      sp.remove('week_steps');
      sp.remove('week_sleep');
    });
  }

  void _synchronize(BuildContext context) async {
    setState(() {
      loading_flag = true;
    });
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
    FitbitActivityTimeseriesDataManager fitbitActivityTimeseriesDataManager =
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

    FitbitSleepDataManager fitbitSleepDataManager = FitbitSleepDataManager(
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
    final sleepData = await fitbitSleepDataManager.fetch(fitbitSleepAPIURL)
        as List<FitbitSleepData>;
    //final response = await getResponse(fitbitSleepAPIURL);

    //trovo durata in minuti del sonno nelle varie giornate
    DateTime current_day = DateTime.now().subtract(Duration(days: 1));
    current_day = DateUtils.dateOnly(current_day);
    final yesterday = current_day;

    //riempimento database (magari mettilo sottoforma di funzione da chiamare)
    DateTime lim_inf = sleepData[0].entryDateTime!;
    DateTime lim_sup = sleepData[0].entryDateTime!;
    num minutes_of_sleep = 0;
    int k = 0;
    double lastweek_steps = 0;
    double lastweek_sleep = 0;

    for (var i = 0; i < sleepData.length - 2; i++) {
      if (DateUtils.dateOnly(sleepData[i].dateOfSleep!) == current_day &&
          DateUtils.dateOnly(sleepData[i + 1].dateOfSleep!) != current_day) {
        lim_sup = sleepData[i].entryDateTime!;
        minutes_of_sleep =
            (lim_sup.millisecondsSinceEpoch - lim_inf.millisecondsSinceEpoch) /
                60000;
        lastweek_steps += stepsData[k].value!;
        lastweek_sleep += minutes_of_sleep;
        print(minutes_of_sleep);
        Day_infos newdayinfos = Day_infos(
          stepsData[6 - k].dateOfMonitoring!.millisecondsSinceEpoch,
          stepsData[6 - k].dateOfMonitoring!,
          stepsData[6 - k].value!,
          minutes_of_sleep.toDouble(),
        ); //devo essere sicuro che non sono null

        //print (newdaysteps);
        await Provider.of<DatabaseRepository>(context, listen: false)
            .insertDayInfos(newdayinfos);

        k = k + 1;

        ///salva in memoria minuti con data
        lim_inf = sleepData[i + 1].entryDateTime!;
        current_day = current_day.subtract(Duration(days: 1));
      }

      if (DateUtils.dateOnly(sleepData[i].dateOfSleep!) == yesterday) {
        Yesterday_sleep newyesterday = Yesterday_sleep(
          sleepData[i].entryDateTime!.millisecondsSinceEpoch,
          DateTime.now().subtract(Duration(days: 1)),
          sleepData[i].level!,
          sleepData[i].entryDateTime!,
        );

        //inserisco primo per discorso indici
        await Provider.of<DatabaseRepository>(context, listen: false)
            .insertYesterdaySleep(newyesterday);
      }
    }

    setState(() {
      sp.setDouble('week_steps', lastweek_steps);
      sp.setDouble('week_sleep', lastweek_sleep);
      loading_flag = false;
    });

  }

  void _tostepsPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(StepsPage.route);
  }

  void _tosleepPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(SleepPage.route);
  }

  void _toExploreCities(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ExploreCities.route);
  }
} //ProfilePage

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  String xData = "";
  num yData = 0;
  String? text;
}
