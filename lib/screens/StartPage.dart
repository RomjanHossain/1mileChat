import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
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

          // resizeToAvoidBottomPadding: false,
          // resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
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
                Flexible(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: isClicked ? SignIn() : SignUp(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 90,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: isClicked
                    ? SignInButton(
                        Buttons.Google,
                        text: "Sign In with Google",
                        onPressed: () {
                          print('google btn clicked');
                        },
                      )
                    : SignInButton(
                        Buttons.Google,
                        text: "Sign Up with Google",
                        onPressed: () {
                          print('google btn clicked');
                        },
                      ),
              ),
              isClicked
                  ? SignInButton(
                      Buttons.FacebookNew,
                      text: "Sign In with Facebook",
                      onPressed: () {
                        print('Facebook btn clicked');
                      },
                    )
                  : SignInButton(
                      Buttons.FacebookNew,
                      text: "Sign Up with Facebook",
                      onPressed: () {
                        print('Facebook btn clicked');
                      },
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
