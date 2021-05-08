import 'package:flutter/material.dart';
import 'package:flutter_fire_base_register/auth/database.dart';
import 'package:flutter_fire_base_register/models/data_test.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    final datas = Provider?.of<List<TestData?>?>(context);
    return StreamBuilder<List<TestData?>?>(
      stream: DataBaseService().datas,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return ListView.builder(
            itemCount: datas!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(5.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.brown[datas[index]!.strength!],
                  ),
                  title: Text('${datas[index]!.name!}'),
                  subtitle: Text('${datas[index]!.sugar!}'),
                ),
              );
            },
          );
        } else {
          return Center(
              child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.red,
            child: Center(child: CircularProgressIndicator()),
          ));
        }
      },
    );
  }
}
