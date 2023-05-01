import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  double firstTextSize;
  double secondTextSize;
  var icon;

  String fName;
  String lName;
  BigCard(
      {required this.fName,
      required this.lName,
      required this.firstTextSize,
      required this.secondTextSize,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: 200,
      width: 240,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.green,
          ),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                fName,
                style: TextStyle(fontSize: firstTextSize),
              )),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              lName,
              style: TextStyle(
                  fontSize: secondTextSize, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
