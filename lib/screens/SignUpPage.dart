import 'package:flutter/material.dart';
import 'package:one_mile_chat/Widgets/signInSignUp.dart';

class StartPage extends StatefulWidget {
  static const String id = '/myid';
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return SignInUI();
  }
}

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'images/chatappBG.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 80),
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
                  RawMaterialButton(
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
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: isClicked ? SignIn() : SignUp(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
