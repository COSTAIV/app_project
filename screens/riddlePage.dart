import 'package:flutter/material.dart';
import 'package:city_app/screens/exploreCities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiddlePage extends StatefulWidget {
  //riddle to unlock every city
  RiddlePage({Key? key}) : super(key: key);

  static const route = '/riddlePage/';
  static const routename = 'RiddlePage';

  @override
  State<RiddlePage> createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  final riddleController = TextEditingController();

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
        child: Column(children: [
          SizedBox(height: 20),
          Container(
            height: 40,
            alignment: AlignmentDirectional(0.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.blue.shade800,
                border: Border.all(
                  width: 7,
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(
                  25,
                )),
            child: Text("Solve this riddle to unlock every city !",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.center),
            constraints: BoxConstraints.expand(width: 350.0, height: 70.0),
          ),
          SizedBox(height: 50),
          Container(
            alignment: AlignmentDirectional(0.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.blue.shade600,
                border: Border.all(
                  width: 7,
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(
                  25,
                )),
            child: Column(children: [
              SizedBox(height: 8.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF2E5A90),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 180.0,
                width: 300,
                child: Text(
                  //Riddle
                  "I have keys but do not lock. I have space but have no room. You can enter but not come in what am I ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF2E5A90),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 60.0,
                width: 300,
                child: TextField(
                  controller: riddleController,
                  obscureText: false,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.question_mark,
                      color: Colors.white,
                    ),
                    hintText: 'Answer',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
              ),
            ]),
            constraints: BoxConstraints.expand(width: 350.0, height: 290.0),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(176, 255, 255, 255).withOpacity(0.8),
        onPressed: () async {
          //check the answer
          if (riddleController.text == 'keyboard' ||
              riddleController.text == 'Keyboard' ||
              riddleController.text == 'KEYBOARD') {
            final sp = await SharedPreferences.getInstance();
            sp.setBool('riddle_answer',
                true); //if the answer is correct you can visit every city,
            _toExploreCities(
                context); //if you log out you have to solve the riddle again.
          } else {
            _toExploreCities(context);
          }
        },
        child: Icon(Icons.check_circle),
      ),
    );
  }

  //build
  void _toExploreCities(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ExploreCities.route);
  }
}
