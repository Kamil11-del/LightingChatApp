import 'package:flutter/material.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key, required this.text, required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      minWidth: 230,
      onPressed: press,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
      color: Colors.deepPurple,
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20),),
    );
  }
}