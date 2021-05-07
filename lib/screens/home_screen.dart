import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/auth/auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthSerives _serives = AuthSerives();

  void logOut(BuildContext context) async {
    await _serives.logOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () => logOut(context),
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            label: Text(
              'log out',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
