import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttt/components/default_button.dart';
import 'package:ttt/repository/auth_functions.dart';
import 'package:ttt/repository/userModel/user_model.dart';
import 'package:ttt/screens/chat_screen/chat_screen.dart';
import 'package:ttt/utils/utils.dart';

class LoginFormFeild extends StatefulWidget {
  const LoginFormFeild({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginFormFeild> createState() => _LoginFormFeildState();
}

class _LoginFormFeildState extends State<LoginFormFeild> {
 String? email;
  String? password;
  bool isObsecure=true;
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(children: [
      buildEmailContainer(),
      SizedBox(height:20),
      buildPassContainer(),
      SizedBox(height: 40,),
      DefaultButton(text: 'Log In', press:()async{
         SignIn(email!, password!, context);
         await UserData.getUserData();
        }
      ),
    ],));
  }

  Container buildPassContainer() {
    return Container(
      width: 300,
      child:TextFormField(
        validator: (value){
          if(value!.isEmpty){
            Utils.flushBarErrorMessage(context: context,message: "Please Enter your Password");
          }
          return null;
        },

        onChanged: (value){
          password =value;
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObsecure,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: 'Enter Your Password',
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon:  IconButton(
              onPressed: () {setState(() {
                isObsecure = !isObsecure;
              });},
              icon: isObsecure?Icon(
                Icons.visibility_off_outlined,
                color: Colors.white,
              ):Icon(
                Icons.visibility_outlined,
                color: Colors.white,
              )),
          border: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container buildEmailContainer() {
    return Container(
      width: 300,
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            Utils.flushBarErrorMessage(context: context,message: "Please Enter your Email");
          }
          return null;
        },
        onChanged: (value){
          email=value;
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          hintText: 'Enter Your Email',
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined,color: Colors.white,),
          border: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}