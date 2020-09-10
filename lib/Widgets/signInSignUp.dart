import 'package:flutter/material.dart';
import 'package:one_mile_chat/screens/homePage.dart';

import '../consts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // TextEditingController controller = TextEditingController();
  // TextEditingController controller2 = TextEditingController();
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
              // controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Email',
                // prefixIcon: FaIcon(FontAwesomeIcons.user),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              // controller: controller2,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          RawMaterialButton(
              // color: Colors.green,

              padding: EdgeInsets.only(top: 16),
              focusColor: Colors.red,
              onPressed: () {
                print('hola');
                // controller.clear();
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

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formValid = GlobalKey<FormState>();
  String _fullname;
  String _password;
  String _email;
  String _phone;
  // TextEditingController controller = TextEditingController();
  // TextEditingController controller2 = TextEditingController();
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
        key: _formValid,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: TextField(
              // controller: controller,
              textCapitalization: TextCapitalization.words,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Full Name',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),

              onChanged: (value) {
                setState(() {
                  _fullname = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: TextField(
              // controller: controller,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: TextField(
              // controller: controller,
              keyboardType: TextInputType.emailAddress,
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              // controller: controller2,

              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Phone',
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  _phone = value;
                });
              },
            ),
          ),
          RawMaterialButton(
            // color: Colors.green,
            padding: EdgeInsets.only(top: 16),
            focusColor: Colors.red,
            onPressed: () {
              if (_formValid.currentState.validate()) {
                _formValid.currentState.save();
              }
              print('$_fullname, $_password, $_email, $_phone');
              // controller.clear();
              // Navigator.pushNamed(context, MyChatScreen.id);
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
