import 'package:flutter/material.dart';
import 'package:one_mile_chat/Widgets/TopPage.dart';
import 'package:one_mile_chat/Widgets/signInSignUp.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
          Align(
            alignment: Alignment(0, 0.6),
            child: SignIn(),
          ),
        ],
      ),
    );
  }
}
