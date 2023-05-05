import 'package:flutter/material.dart';
import 'home.dart';
import 'package:slide_drawer/slide_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlideDrawer(
        offsetFromRight: 200.0,
        items: [
          MenuItem('Home', icon: Icons.home, onTap: () {}),
          MenuItem('Project', icon: Icons.rss_feed, onTap: () {}),
          MenuItem('Login', icon: Icons.login, onTap: () {}),
          MenuItem('Profile', icon: Icons.person_outline, onTap: () {}),
          MenuItem('Setting', icon: Icons.settings, onTap: () {}),
        ],
        brightness: Brightness.dark,
        backgroundGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [
            Colors.green,
            Color(0xFF1CB5E0),
          ],
        ),
        child: HomePage(),
      ),
    );
  }
}
