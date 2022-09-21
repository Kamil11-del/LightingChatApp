import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttt/repository/saving_messages.dart';
import 'package:ttt/repository/userModel/user_model.dart';
import 'package:ttt/screens/welcomScreen/welcom_screen.dart';
import 'components/message_bubbles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String routName = "/chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    UserData.getUserData();
    getCurrentUser();
  }
User loggedInUser=FirebaseAuth.instance.currentUser!;
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? messageText;
  final messageController = TextEditingController();

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF785FE1),
          title: Text(
            'Flash Chat',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.pushNamed(context, WelcomScreen.routName);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              left: 0,
                right: 0,
                bottom: 0,
                top: 0,
                child: Image.asset('assets/chatimg.png',fit: BoxFit.fill,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: fireStore.collection('messages').orderBy('createdAt',descending: true).snapshots(),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      final messages = snapShot.data!.docs;
                      List<MessageBubbles> messageBubbles = [];
                      for (var message in messages) {
                        final messageText = (message.data() as Map)['text'];
                        final senderEmail = (message.data() as Map)['senderEmail'];
                        final senderName = (message.data() as Map)['senderName'];


                        final currentUser=loggedInUser.email;
                        final messageBubble = MessageBubbles(
                          isMe:currentUser==senderEmail,
                            sender: senderName, message: messageText);
                        messageBubbles.add(messageBubble);
                      }
                      return Expanded(child: ListView(
                        reverse: true,
                          children: messageBubbles));
                    }
                    return CircularProgressIndicator();
                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            controller: messageController,
                            onChanged: (value) {
                              messageText = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                                hintText: 'Type your message here..',
                                hintStyle: TextStyle(color: Colors.white),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Color(0xFF785FE1))),
                                border:
                                    OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.white))),

                          ),
                        ),
                      ),
                      SizedBox(width: 3.0,),
                      RawMaterialButton(
                        constraints: BoxConstraints(
                          minWidth: 45,
                          minHeight: 45,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        fillColor:  Color(0xFF785FE1),
                          onPressed: () {
                            if (messageText != null) {
                              saveMessage(messageText!);
                              messageText = null;
                            }
                            messageController.clear();
                          },
                          child: Icon(Icons.send,color: Colors.white,))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
