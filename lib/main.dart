import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/auth/auth.dart';
import 'package:flutter_fire_base_register/controller.dart';

import 'package:provider/provider.dart';

import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Users?>.value(
          value: AuthSerives().user,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Log In and Sign In Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Controller(),
      ),
    );
  }
}
