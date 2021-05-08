import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fire_base_register/models/data_test.dart';
import 'package:flutter_fire_base_register/models/user_model.dart';

class DataBaseService {
  final String? uid;

  DataBaseService({this.uid});

  /// collection reference 'test'.
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

  /// user data from snapshot
  UsersData _userDataFromSnapshot(DocumentSnapshot? snapshot) {
    return UsersData(
      uid: uid!,
      name: snapshot!['name'] ?? '',
      sugars: snapshot['sugars'] ?? '',
      strength: snapshot['strength'] ?? 0,
    );
  }

  /// get stream
  Stream<List<TestData?>?> get datas {
    return _reference.snapshots().map(_testListFromSnapshot);
  }

  /// get user doc stream
  Stream<UsersData?> get userData {
    return _reference.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
