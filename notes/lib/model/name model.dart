import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class nameModel {
  final String? name;


  nameModel(
      {
        required this.name,
        });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{

      'name': name,

    };
  }

  factory nameModel.fromMap(Map<String, dynamic> map) {
    return nameModel(

      name: map['name'] != null ? map['name']as String:null,
    );
  }

  factory nameModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return nameModel(

        name: doc['name'],

    );

  }
}