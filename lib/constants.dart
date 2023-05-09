import 'package:flutter/material.dart';

const kBackgroundColor = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomCenter,
      colors: [Colors.lightGreenAccent, Color(0xff2B7A0B), Colors.black]),
);

const kTextColor = Color(0xff00337C);

const kDarkGreen = Color(0xff2B7A0B);

const kBackgroundColorTwo = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.lightGreenAccent,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.black
      ]),
);

const kTextStyleWhite = TextStyle(color: Colors.white);

const kEmailTextFieldDecoration = InputDecoration(
  hintText: 'Email',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kPasswordTextFieldDecoration = InputDecoration(
  hintText: 'Password',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kBackGroundGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.0, 1.0],
  colors: [
    Colors.green,
    Color(0xFF1CB5E0),
  ],
);
