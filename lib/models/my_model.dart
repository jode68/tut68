import 'package:cloud_firestore/cloud_firestore.dart';

class MyModel {
  String name;
  String year;

  MyModel({
    required this.name,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'year': year,
    };
  }

  factory MyModel.fromJson(DocumentSnapshot snapshot) {
    return MyModel(
      name: snapshot['name'],
      year: snapshot['year'],
    );
  }
}
