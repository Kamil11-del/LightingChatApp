import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttt/screens/chat_screen/chat_screen.dart';
import 'package:ttt/utils/utils.dart';

SignUp(
  String email,
  String password,
  BuildContext context,
  String name,
) async {
  showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ));
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password,);
    await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
      'email':email,
      'name':name,
    });
    Navigator.pushNamed(context, ChatScreen.routName);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Utils.flushBarErrorMessage(message: 'Weak Password', context: context);
    } else if (e.code == 'email-already-in-use') {
      Utils.flushBarErrorMessage(
          context: context, message: 'Email is already in use');
    }
  } catch (e) {
    print(e);
  }
}

////////////////
SignIn(
  String email,
  String password,
  BuildContext context,
) async {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: CircularProgressIndicator(),
          ));
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.pushNamed(context, ChatScreen.routName);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Utils.flushBarErrorMessage(context: context, message: 'No user Found');
    } else if (e.code == 'wrong-password') {
      Utils.flushBarErrorMessage(context: context, message: 'Wrong Password');
    }
  } catch (e) {
    print(e);
  }
}
