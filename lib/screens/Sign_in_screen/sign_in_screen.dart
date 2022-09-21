import 'package:flutter/material.dart';
import 'package:ttt/screens/Sign_in_screen/components/body.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
static String routName="/signIn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF785FE1),
      appBar: AppBar(title: Text('Log In'),
      backgroundColor: Color(0xFF785FE1),
      ),
      body:Body() ,
    );
  }
}
