import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ttt/repository/userModel/user_model.dart';

void saveMessage(String msgSave)async{
  User loggedInUser = FirebaseAuth.instance.currentUser!;
  await FirebaseFirestore.instance.collection('messages').add({
    'senderEmail':loggedInUser.email,
    'text':msgSave,
    'createdAt':Timestamp.now(),
    'senderName':UserData.name,
  });
}
