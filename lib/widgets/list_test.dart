import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/models/data_test.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<List<TestData?>?>(context);
    datas!.forEach((element) {
      print(element!.name);
      print(element.sugar);
      print(element.strength);
    });
    return Container();
  }
}
