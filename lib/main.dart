import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ttt/repository/userModel/user_model.dart';
import 'package:ttt/routes.dart';
import 'constant.dart';
import 'screens/Splash_Screen/splash_screen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserData.getUserData();
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute:SplashScreen.routName,
      routes:routes,
    );
  }
}
