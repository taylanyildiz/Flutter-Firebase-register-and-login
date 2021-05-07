import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fire_base_register/models/data_test.dart';

class DataBaseService {
  final String? uid;

  DataBaseService({this.uid});

  /// collection reference
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('test');

  Future updateUserData(String? sugars, String? name, int? strength) async {
    return await _reference.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  /// [TestData] list from snapshot.
  List<TestData> _testListFromSnapshot(QuerySnapshot? snapshot) {
    return snapshot!.docs.map((DocumentSnapshot doc) {
      return TestData(
        name: doc['name'] ?? '',
        sugar: doc['sugars'] ?? '',
        strength: doc['strength'] ?? 0,
      );
    }).toList();
  }

  /// get stream
  Stream<List<TestData?>?> get datas {
    return _reference.snapshots().map(_testListFromSnapshot);
  }
}
