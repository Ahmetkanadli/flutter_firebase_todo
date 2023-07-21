import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Providers/id_provider.dart';

class Auth {
  final userCollection = FirebaseFirestore.instance;

  final FirebaseAuth firebaseauth = FirebaseAuth.instance;
  Stream<User?> get authstatechanges => firebaseauth.authStateChanges();

  late String uuid ;

  Future<void> signUp(
      {required String name, required String email, required String password, required WidgetRef ref}) async {
    try {
      final UserCredential usercrenditial = await firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);
      uuid = usercrenditial.user!.uid;
      if (uuid != null) {
        //ref.watch(idProvider.notifier).update((state) => uuid);
      }

      if (usercrenditial.user != null) {
        _registerUser(name: name, email: email, password: password,);
      }


      /*
      userCollection.collection("users").add({
      }).then((value){
        print("Value = ${value.id}");

        userCollection.collection("users").doc(value.id).collection("todoApp").add({"Notlar":''});});
       */

      //üstte subcollection oluşturduk
    } on FirebaseException catch (e) {
      //fluttertoast paketi kullanılabilir
      e.message;
    }
  }

  Future<void> singIn(
      {required String email, required String password, required WidgetRef ref}) async {
    try {
      final UserCredential usercrenditial = await firebaseauth
          .signInWithEmailAndPassword(email: email, password: password);
      print("user id : ${usercrenditial.user!.uid}");
      uuid = usercrenditial.user!.uid;
      ref.watch(idProvider.notifier).update((state) => usercrenditial.user!.uid);
    } on FirebaseException
    catch (e) {
      e.message;
    }
  }

  Future<void> _registerUser(
      {required String name, required String email, required String password}) async {
    await userCollection.collection("users").doc(uuid).set({
      "name": name,
      "email": email,
      "password": password,
    });
    print("uuid  ${uuid}");
  }

}













/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth{
  final userCollection = FirebaseFirestore.instance;
  final firebaseauth = FirebaseAuth.instance;

   late var uuid;

  Future<void> signUp({required String email, required String password})async{
    try{

      final UserCredential usercrenditial = await firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
       uuid = usercrenditial.user!.uid;

      if(usercrenditial.user != null){
        _registerUser(email: email, password: password,);
      }


      /*
      userCollection.collection("users").add({
      }).then((value){
        print("Value = ${value.id}");

        userCollection.collection("users").doc(value.id).collection("todoApp").add({"Notlar":''});});
       */

      //üstte subcollection oluşturduk
    } on FirebaseException catch(e){
      //fluttertoast paketi kullanılabilir
      e.message;
    }
  }

  Future<void> singIn({required String email, required String password})async{
    try{
      final UserCredential usercrenditial= await firebaseauth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException
    catch(e){
      e.message;
    }
  }

  Future<void> _registerUser({required String email, required String password})async{

    await userCollection.collection("users").doc(uuid).set({
      "email" : email,
      "password" : password,
    }).then((val){


      userCollection.collection("users").doc(uuid).collection("todoApp").add({"Notlar":''});});
    print("uuid${uuid}");
  }
}















/*
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> singWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailandPassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> anaonimgiris()async{
    await _firebaseAuth.signInAnonymously();
  }

  Future<void> singOut()async{
    await _firebaseAuth.signOut();
  }
}

 */
 */