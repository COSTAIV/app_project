import 'package:flutter/material.dart';
import 'package:city_app/screens/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  static const route = '/settingsPage/';
  static const routename = 'SettingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final nicknameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    print('${SettingsPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text("App Settings", textScaleFactor: 0.9),
        backgroundColor: Color.fromARGB(177, 44, 100, 212).withOpacity(0.8),
        leading: IconButton(
          onPressed: () {
            _toProfilePage(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final sp = snapshot.data as SharedPreferences;
              return SettingsList(
                sections: [
                  SettingsSection(
                    title: Text('Account'),
                    tiles: <SettingsTile>[
                      SettingsTile.navigation(
                        leading: Icon(Icons.person),
                        title: Text('Nickname'),
                        value: TextField(
                          controller: nicknameController,
                          obscureText: false,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            hintText: sp.getString('nickname'),
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SettingsTile.navigation(
                        leading: Icon(Icons.email),
                        title: Text('Email'),
                        value: TextField(
                          controller: emailController,
                          obscureText: false,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            hintText: sp.getString('current_email'),
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      SettingsTile.navigation(
                        leading: Icon(Icons.password),
                        title: Text('Password'),
                        value: TextField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            hintText: sp.getString('current_password'),
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(176, 255, 255, 255).withOpacity(0.8),
        onPressed: () async {
          final sp = await SharedPreferences.getInstance();
          sp.setString('nickname', nicknameController.text);
          sp.setString('current_email', emailController.text);
          sp.setString('current_password', passwordController.text);
          _toProfilePage(context);
        },
        child: Icon(Icons.check_circle),
      ),
    );
  }

  void _toProfilePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ProfilePage.route);
  } //_toProfilePage

}
