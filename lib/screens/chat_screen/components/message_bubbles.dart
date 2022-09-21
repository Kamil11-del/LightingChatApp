import 'package:flutter/material.dart';

class MessageBubbles extends StatelessWidget {
  MessageBubbles({Key? key, required this.sender, required this.message,required this.isMe})
      : super(key: key);
  final sender;
  final message;
  bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            '$sender',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          Material(
            color:isMe? Color(0xFF7B69FF):Color(0xFFBA02EE),
            elevation: 5,
            borderRadius:isMe? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ):BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
