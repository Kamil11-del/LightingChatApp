import 'package:flutter/material.dart';
import 'package:ttt/screens/welcomScreen/components/body.dart';
class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);
static String routName="/welcome_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF785FE1),
      body: Body(),
    );
  }
}
