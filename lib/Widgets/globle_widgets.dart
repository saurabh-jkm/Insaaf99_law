// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/style.dart';

Widget GoogleText(
    {text = "",
    color = Colors.black,
    fsize = 15.0,
    fweight = FontWeight.normal,
    fstyle = FontStyle.normal,
    maxline = 3}) {
  return Text("$text",
      maxLines: maxline,
      style: GoogleFonts.alike(
          color: color,
          fontSize: fsize,
          fontWeight: fweight,
          fontStyle: fstyle));
}

// Button
Widget themeButton3(BuildContext context, fn,
    {label = 'Submit',
    fontSize = 16.0,
    arg = 0,
    buttonColor = '',
    radius = 32.0,
    borderColor = '',
    btnWidthSize = 100.0,
    btnHeightSize = 40.0}) {
  buttonColor = (buttonColor == '') ? Colors.black12 : buttonColor;
  return Container(
    child: Center(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            onPrimary: buttonColor,
            shadowColor: Color.fromARGB(255, 165, 165, 165),
            elevation: 3,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: (borderColor == '') ? buttonColor : borderColor),
                borderRadius: BorderRadius.circular(radius)),
            minimumSize: Size(btnWidthSize, btnHeightSize), //////// HERE
          ),
          onPressed: () {
            if (arg == 0) {
              fn();
            } else {
              fn(arg);
            }
          },
          child:
              GoogleText(text: '$label', fsize: fontSize, color: Colors.white)),
    ),
  );
}

themeAlert(context, msg, {type = 'success'}) {
  // print("object  $msg  $type ++++++++++++++++    ");
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("$msg"),
      backgroundColor: (type == 'success')
          ? Color.fromARGB(255, 72, 170, 137)
          : Color.fromARGB(255, 214, 99, 12),
    ),
  );
}

// Pleas wait progress

pleaseWait(BuildContext context, {containerHeight = 300.0}) {
  return Container(
    height: containerHeight,
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [progress(), SizedBox(height: 20.0), Text("wait")]),
  );
}
