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
