import 'package:cloud_firestore/cloud_firestore.dart';

class MyModel {
  String name;
  String year;
  String prod;

  MyModel({required this.name, required this.year, required this.prod});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'year': year,
      'prod': prod,
    };
  }

  factory MyModel.fromJson(DocumentSnapshot snapshot) {
    return MyModel(
      name: snapshot['name'],
      year: snapshot['year'],
      prod: snapshot['prod'],
    );
  }
}
