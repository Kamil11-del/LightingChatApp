import 'package:flutter/material.dart';
import 'package:ttt/components/default_button.dart';
import 'package:ttt/screens/Sign_in_screen/components/login_form_feild.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height:MediaQuery.of(context).size.height *0.1,),
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image(image: AssetImage('assets/img1.png'),),
              ),
            ),
           LoginFormFeild(),

          ],
        ),
      ),
    );
  }
}
