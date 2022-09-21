import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ttt/components/default_button.dart';
import 'package:ttt/repository/auth_functions.dart';
import 'package:ttt/repository/userModel/user_model.dart';
import 'package:ttt/screens/chat_screen/chat_screen.dart';
import 'package:ttt/screens/registran_screen/components/profile_cont.dart';
import 'package:ttt/utils/utils.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? email;
  String? password;
  String? name;
  String? confirmPass;
  final formKey = GlobalKey<FormState>();
  bool isObsecurePass = true;
  File? _pickedImg;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0100,
            ),
            PofileContainer(),
            SizedBox(
              height: 40.0,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      child: buildNameFormField(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: buildEmailFormField(),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 300,
                      child: buildPassFormField(),
                    ),
                  ],
                )),
            SizedBox(
              height: 40,
            ),
            DefaultButton(
                text: 'Sign up',
                press: () async{
                  await UserData.getUserData();
                  if (formKey.currentState!.validate()) {
                    SignUp(email!, password!, context, name!);
                  }
                }),
          ],
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          Utils.flushBarErrorMessage(
              context: context, message: "Please Enter your Name");
        }
        return null;
      },
      onChanged: (value) {
        name = value;
      },
      keyboardType: TextInputType.text,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintText: 'Enter Your Name',
        labelText: 'Name',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.person_outline,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextFormField buildPassFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          Utils.flushBarErrorMessage(
              context: context, message: "Please Enter your Password");
        }
        return null;
      },
      onChanged: (value) {
        password = value;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObsecurePass,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintText: 'Enter Your Password',
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObsecurePass = !isObsecurePass;
              });
            },
            icon: isObsecurePass
                ? Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.visibility_outlined,
                    color: Colors.white,
                  )),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          Utils.flushBarErrorMessage(
              context: context, message: "Please Enter your Email");
        }
        return null;
      },
      onChanged: (value) {
        email = value;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintText: 'Enter Your Email',
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.email_outlined,
          color: Colors.white,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}


