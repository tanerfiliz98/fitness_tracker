import 'package:cloud_firestore/cloud_firestore.dart';

class WeightModel {
  String? documentId;
  num? exerciseId;
  String? exerciseName;
  num? exerciseWeight;
  num? addedExeciseWeightCount;

  WeightModel({
    this.documentId,
    this.exerciseId,
    this.exerciseName,
    this.exerciseWeight,
    this.addedExeciseWeightCount
  });

  WeightModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    documentId = doc.id;
    exerciseWeight = doc["exerciseWeight"];
    exerciseName = doc["exerciseName"];
    exerciseId = doc["exerciseId"];
    addedExeciseWeightCount = doc["addedExeciseWeightCount"];

  }
}