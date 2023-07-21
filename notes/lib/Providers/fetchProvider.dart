import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes/Providers/id_provider.dart';
import 'package:notes/model/model.dart';

import '../services/todo_service.dart';

final seviceProvider = StateProvider<TodoService>((ref) {
  // final id = ref.watch(idProvider);
  return TodoService();
});

final fetchStreamProvider = StreamProvider<List<TodoModel>>((ref) async* {
  /*
    final user = FirebaseFirestore.instance
      .collection('users')
      .doc('CEifNK0KUvIuFSCKVUte');
  final getData =
  user.collection('todo')
      .get()
      .then((querySnapshot) {
    return querySnapshot.docs
        .map((snapshot) => TodoModel.fromSnapshot(snapshot))
        .toList();
  });



  yield* Stream.fromFuture(getData);

   */

  if(ref.watch(idProvider) != ''){
    final getData = FirebaseFirestore.instance
        .collection('users')
        .doc(ref.watch(idProvider))
        .collection('todo')
        .snapshots()
        .map((event) => event.docs
        .map((snapshot) => TodoModel.fromSnapshot(snapshot))
        .toList());

    yield* getData;
  }
});
