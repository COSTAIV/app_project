import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:city_app/screens/exploreCities.dart';

class RiddlePage extends StatelessWidget {
  RiddlePage({Key? key}) : super(key: key);

  static const route = '/riddlePage/';
  static const routename = 'RiddlePage';

  @override
  Widget build(BuildContext context) {
    print('${RiddlePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(RiddlePage.routename, textScaleFactor: 0.9),
        backgroundColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
        leading: IconButton(
          onPressed: () {
            _toExploreCities(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 38, 45, 50),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            color: Colors.green,
            child: Text("Mettere indovinello"),
            constraints: BoxConstraints.expand(width: 350.0, height: 400.0),
          ),
        ),
      ),
    );
  } //build

  void _toExploreCities(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ExploreCities.route);
  }
}
