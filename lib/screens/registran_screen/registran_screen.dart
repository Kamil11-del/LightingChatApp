import 'package:flutter/material.dart';
import 'package:ttt/screens/registran_screen/components/body.dart';
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
static String routName="/Registration";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xFF785FE1),
      appBar: AppBar(title: Text('Sign Up'),
      backgroundColor: Color(0xFF785FE1),
      ),
      body: Body(),
    );
  }
}
