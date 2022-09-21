import 'package:flutter/material.dart';
ThemeData theme(){
  return  ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  );
}
final kTextColor=Colors.grey;

final colorizeColors = [
  Colors.white,
  Colors.purple,
  Colors.lightBlueAccent,
  Colors.cyanAccent,
];