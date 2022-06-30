import 'package:city_app/database/entities/dayinfos.dart';
import 'package:city_app/repository/databaseRepository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:city_app/screens/profilePage.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SleepPage extends StatelessWidget {
  SleepPage({Key? key}) : super(key: key);

  static const route = '/sleepPage/';
  static const routename = 'SleepPage';

  final _tooltipBehavior =
      TooltipBehavior(enable: true); //to select the datapoints of the graph

  final _zoomPanBehavior = ZoomPanBehavior(
    //to zoom the graph
    enableSelectionZooming: true,
    selectionRectBorderColor: Colors.red,
    selectionRectBorderWidth: 1,
    selectionRectColor: Colors.grey,
    enablePinching: true,
    zoomMode: ZoomMode.x,
    enablePanning: true,
  );

  @override
  Widget build(BuildContext context) {
    print('${SleepPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(SleepPage.routename, textScaleFactor: 0.9),
        backgroundColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
        leading: IconButton(
          onPressed: () {
            _toProfilePage(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Center(
        child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          return FutureBuilder(
            initialData: null,
            future:
                dbr.findAllDayInfos(), //to take the datapoints for the graph
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as List<Day_infos>;

                return SfCartesianChart(
                  //graph building
                  title: ChartTitle(
                      text: 'Your hours of sleep',
                      textStyle: TextStyle(
                          fontSize: 26.0, fontStyle: FontStyle.italic)),
                  legend: Legend(isVisible: false),
                  tooltipBehavior: _tooltipBehavior,
                  zoomPanBehavior: _zoomPanBehavior,
                  enableAxisAnimation: true,
                  series: <ChartSeries>[
                    //datapoints of the graph
                    LineSeries<Day_infos, DateTime>(
                        name: 'hours of sleep',
                        dataSource: data,
                        xValueMapper: (Day_infos day_sleep, _) =>
                            day_sleep.dateTime,
                        yValueMapper: (Day_infos day_sleep, _) => double.parse(
                            (day_sleep.sleep_minutes / 60).toStringAsFixed(2)),
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        enableTooltip: true)
                  ],
                  primaryXAxis: DateTimeAxis(
                    enableAutoIntervalOnZooming: true,
                  ),
                  primaryYAxis: NumericAxis(),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          );
        }),
      ),
    );
  } //build

  void _toExploresCities(BuildContext context) {
    Navigator.pushNamed(context, '/exploreCities/');
  }

  void _toProfilePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ProfilePage.route);
  } //_toProfilePage

} //StepsPage





