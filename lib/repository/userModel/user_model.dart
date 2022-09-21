import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  static String? name;
  static String? email;
  static String? image;

  static getUserData() async {
    var user = await FirebaseAuth.instance.currentUser;
    if(user!=null){
      var userUid =await user.uid;
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc(userUid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var userName = data?['name'];
      name=userName;
    }
  }
}
}