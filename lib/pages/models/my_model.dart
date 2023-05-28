import 'package:cloud_firestore/cloud_firestore.dart';

class MyModel {
  String name;

  MyModel({
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  factory MyModel.fromJson(DocumentSnapshot snapshot) {
    return MyModel(name: snapshot['name']);
  }
}
