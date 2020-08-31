import 'package:flutter/material.dart';
import 'package:one_mile_chat/screens/homePage.dart';

import '../consts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(0, 10),
            blurRadius: 10,
            // spreadRadius: 40.0,
          )
        ],
      ),
      height: MediaQuery.of(context).size.width / 1,
      width: MediaQuery.of(context).size.width / 1.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/rick.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              controller: controller2,
              obscureText: true,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter Password'),
            ),
          ),
          RawMaterialButton(
              // color: Colors.green,

              padding: EdgeInsets.only(top: 16),
              focusColor: Colors.red,
              onPressed: () {
                print('hola');
                controller.clear();
                Navigator.pushNamed(context, MyChatScreen.id);
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              )),
        ],
      ),
    );
  }
}
