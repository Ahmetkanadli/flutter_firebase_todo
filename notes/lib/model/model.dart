// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String? docId;
  final String titleTask;
  final String description;
  final String dateTask;
  final String timeTask;
  late bool isComplited;

  TodoModel(
      {this.docId,
      required this.titleTask,
      required this.description,
      required this.dateTask,
      required this.timeTask,
      required this.isComplited});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'titleTask': titleTask,
      'description': description,
      'dateTask': dateTask,
      'timeTask': timeTask,
      'isComplited': false,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      docId: map['docId'] != null ? map['docId'] as String : null,
      titleTask: map['titleTask'] as String,
      description: map['description'] as String,
      dateTask: map['dateTask'] as String,
      timeTask: map['timeTask'] as String,
      isComplited: map['isComplited'] as bool,
    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return TodoModel(
        docId: doc.id,
        titleTask: doc['titleTask'],
        description: doc['description'],
        dateTask: doc['dateTask'],
        timeTask: doc['timeTask'],
        isComplited : doc['isComplited']
    );

  }
}
