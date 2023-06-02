import 'dart:async';

import 'package:fitness_tracker/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker/model/weight_model.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Database._privateConstructor();
  static final Database instance = Database._privateConstructor();

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
        "familyId": "",
        "lastAlarmId": 1
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("users").doc(uid).get();
      print(doc.exists);
      return UserModel.fromDocumentSnapshot(doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Stream<List<WeightModel>>> weightStream(String uid) async {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("weights")
        .orderBy("exerciseId", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<WeightModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(WeightModel.fromDocumentSnapshot(element));
      }
      return retVal;
    });
  }

  Future<void> addWeight(String uid, WeightModel weight) async {
    try {
      var addedWeight =
          weight.exerciseWeight! + weight.addedExeciseWeightCount!;
      _firestore
          .collection("users")
          .doc(uid)
          .collection("weights")
          .doc(weight.documentId)
          .update({"exerciseWeight": addedWeight});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
   Future<void> removeWeight(String uid, WeightModel weight) async {
    try {
      var addedWeight =
          weight.exerciseWeight! - weight.addedExeciseWeightCount!;
      _firestore
          .collection("users")
          .doc(uid)
          .collection("weights")
          .doc(weight.documentId)
          .update({"exerciseWeight": addedWeight});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
