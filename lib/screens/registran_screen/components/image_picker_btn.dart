import 'package:flutter/material.dart';
InkWell buildImgPickerBtn({required IconData icon,required String type,required GestureTapCallback press}) {
  return InkWell(
    onTap:press,
    splashColor: Color(0xFF9781FA),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          type,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}