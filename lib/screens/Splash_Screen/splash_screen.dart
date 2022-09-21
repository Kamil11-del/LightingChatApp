import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttt/screens/chat_screen/chat_screen.dart';
import 'package:ttt/screens/welcomScreen/welcom_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routName = "/SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final user=  FirebaseAuth.instance.currentUser;
    if(user != null){
      Timer(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, ChatScreen.routName);
      });
    }
    else if (user == null){
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushReplacementNamed(
            context,
            WelcomScreen.routName,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Column(
        children: [
          Spacer(),
          Image(
              height: 100,
              color: Color(0xFF034488),
              image: AssetImage('assets/flashimg.png')),
          Spacer(),
          Text(
            'from',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                child: Image.asset('assets/img1.png'),
              ),
              Text(
                'Flash',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
