import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ttt/components/default_button.dart';
import 'package:ttt/constant.dart';
import 'package:ttt/screens/Sign_in_screen/sign_in_screen.dart';
import 'package:ttt/screens/registran_screen/registran_screen.dart';
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}
class _BodyState extends State<Body> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
    controller=AnimationController(duration: Duration(seconds: 1),
      vsync: this,upperBound: 100.0,
    );
    controller!.forward();
    controller!.addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.10,
          ),
           Container(
             width: MediaQuery.of(context).size.width * 0.3,
             height: MediaQuery.of(context).size.height *0.3,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
             child:  CircleAvatar(
               backgroundColor: Colors.transparent,
                 child: Image(
                   height: 100,
                   width: 100,
                   image: AssetImage('assets/flashimg.png'),),
               ),
             ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Hero(
                 tag: 'logo',
                 child: Container(height: 60.0,
                 child: Image(
                   height: controller!.value,
                   image: AssetImage('assets/img1.png'),),
                 ),
               ),
               AnimatedTextKit(animatedTexts: [
                 ColorizeAnimatedText('Flash chat',
                 colors: colorizeColors,
                 textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 34,),),

               ])
             ],
           ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          DefaultButton(text: 'Sign In',press: ()=>Navigator.pushNamed(context, SignInScreen.routName,),),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          DefaultButton(text: 'Sign Up',press: ()=>Navigator.pushNamed(context, RegistrationScreen.routName,
          ),),

        ],
      ),
    );
  }
}


