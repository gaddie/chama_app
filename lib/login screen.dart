import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: BoxDecoration(gradient: kBackGroundGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 10),
                child: TextField(
                  onChanged: (email) {},
                  decoration: kEmailTextFieldDecoration,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (email) {},
                  decoration: kPasswordTextFieldDecoration,
                ),
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white, // set the text color to white
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: FilledButton(
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios_new),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Back',
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  Colors.white, // set the text color to white
                            ),
                          ),
                        ]),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
