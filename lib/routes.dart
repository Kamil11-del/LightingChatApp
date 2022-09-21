

import 'package:flutter/material.dart';
import 'package:ttt/screens/Sign_in_screen/sign_in_screen.dart';
import 'package:ttt/screens/Splash_Screen/splash_screen.dart';
import 'package:ttt/screens/chat_screen/chat_screen.dart';
import 'package:ttt/screens/registran_screen/registran_screen.dart';
import 'package:ttt/screens/welcomScreen/welcom_screen.dart';

final Map<String,WidgetBuilder> routes={
  SplashScreen.routName:(context)=>SplashScreen(),
  WelcomScreen.routName:(context)=>WelcomScreen(),
  RegistrationScreen.routName:(context)=>RegistrationScreen(),
  SignInScreen.routName:(context)=>SignInScreen(),
  ChatScreen.routName:(context)=>ChatScreen(),
};