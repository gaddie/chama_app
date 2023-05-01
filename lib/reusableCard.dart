import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  String label;
  var icon;
  double cardHeight;
  double cardWidth;
  double iconSize;

  ReusableCard(
      {required this.icon,
      required this.iconSize,
      required this.label,
      required this.cardHeight,
      required this.cardWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      height: cardHeight,
      width: cardWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: Colors.green,
          ),
          Text(label),
        ],
      ),
    );
  }
}
