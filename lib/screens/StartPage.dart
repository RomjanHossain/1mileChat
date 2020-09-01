import 'package:flutter/material.dart';
import 'package:one_mile_chat/Widgets/TopPage.dart';
import 'package:one_mile_chat/Widgets/signInSignUp.dart';

class StartPage extends StatefulWidget {
  static const String id = '/myid';
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Expanded(
            child: TopPage(
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            top: 190,
            left: 120,
            child: RawMaterialButton(
              onPressed: () {
                print('signIn clicked');
                setState(() {
                  isClicked = true;
                });
              },
              child: isClicked
                  ? Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    )
                  : Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 50,
                      ),
                    ),
            ),
          ),
          Positioned(
            top: 190,
            left: 300,
            child: RawMaterialButton(
              onPressed: () {
                print('signIn clicked');
                setState(() {
                  isClicked = false;
                });
              },
              child: isClicked
                  ? Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  : Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.6),
            child: isClicked ? SignIn() : SignUp(),
          ),
        ],
      ),
    );
  }
}