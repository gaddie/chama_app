import 'package:flutter/material.dart';
import 'home.dart';
import 'login screen.dart';
// import 'project.dart';

// import 'profile.dart';
// import 'setting.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SlideDrawer(
              offsetFromRight: 200.0,
              items: [
                MenuItem('Home', icon: Icons.home, onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                }),
                MenuItem('Project', icon: Icons.rss_feed, onTap: () {
                  Navigator.pushReplacementNamed(context, '/project');
                }),
                MenuItem('Login', icon: Icons.login, onTap: () {
                  Navigator.pushReplacementNamed(context, '/login');
                }),
                MenuItem('Profile', icon: Icons.person_outline, onTap: () {
                  Navigator.pushReplacementNamed(context, '/profile');
                }),
                MenuItem('Setting', icon: Icons.settings, onTap: () {
                  Navigator.pushReplacementNamed(context, '/setting');
                }),
              ],
              brightness: Brightness.dark,
              backgroundGradient: kBackGroundGradient,
              child: HomePage(),
            ),
        // '/project': (context) => ProjectPage(),
        '/login': (context) => LoginPage(),
        // '/profile': (context) => ProfilePage(),
        // '/setting': (context) => SettingPage(),
      },
    );
  }
}
