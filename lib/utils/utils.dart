import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
class Utils {

  static void flushBarErrorMessage({String? message, BuildContext? context}){

    showFlushbar(context: context!,
        flushbar: Flushbar(
          message: message,
          duration: Duration(seconds: 3),
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.redAccent,
          reverseAnimationCurve: Curves.easeInOut,
          forwardAnimationCurve: Curves.decelerate,
          icon: Icon(Icons.error,color: Colors.white,size: 28,),
        )..show(context));
  }
}