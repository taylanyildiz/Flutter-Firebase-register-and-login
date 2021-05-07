import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/models/user_model.dart';
import 'package:flutter_fire_base_register/screens/screen.dart';
import 'package:provider/provider.dart';

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return user != null ? HomeScreen() : WelcomeScreen();
  }
}
