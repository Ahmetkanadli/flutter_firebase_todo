import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/src/consumer.dart';

import '../Providers/id_provider.dart';
import '../model/model.dart';

class TodoService {

 // final todoCollection = FirebaseFirestore.instance.collection('users').doc().collection("todoApp");
  final userCollection = FirebaseFirestore.instance;



  void addNewTask(TodoModel model, WidgetRef ref){
    //todoCollection.add(model.toMap()); ilk
    final ids =ref.watch(idProvider);// testlerden sonra kullanılacak
    print("id yırtıl= ${ids}");  //testlerden sonra kullanılacak
    print("not id : ${model.docId}");
      userCollection.collection("users").doc(ids).collection("todo").add(model.toMap());
    print("not id : ${model.docId}");
  }

  void updateTask(String? docID, bool valueUpdate){

  }
  void deleteTeask(String ? docID){

  }

}