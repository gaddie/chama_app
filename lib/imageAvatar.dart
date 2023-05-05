import 'package:flutter/material.dart';

class MembersAvatar extends StatelessWidget {
  String name;
  String image;

  MembersAvatar({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/$image'),
              )
            ],
          ),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
