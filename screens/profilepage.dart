import 'package:flutter/material.dart';
import 'package:city_app/screens/loginPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: const Text(ProfilePage.routename),
      ),
      body: const Center(
          child: Text('login_flow'),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('login_flow'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _toLoginPage(context),
            ),
          ],
        ),
      ),
    );
  } //build

  void _toLoginPage(BuildContext context){
    //Pop the drawer first 
    Navigator.pop(context);
    
    Navigator.of(context).pushReplacementNamed(LoginPage.route);
  }

} 