import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/auth/auth.dart';
import 'package:flutter_fire_base_register/auth/database.dart';
import 'package:flutter_fire_base_register/models/data_test.dart';
import 'package:flutter_fire_base_register/widgets/list_test.dart';
import 'package:provider/provider.dart';

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
    return StreamProvider<List<TestData?>?>.value(
      value: DataBaseService().datas,
      initialData: null,
      child: Scaffold(
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
        body: ListWidget(),
      ),
    );
  }
}
