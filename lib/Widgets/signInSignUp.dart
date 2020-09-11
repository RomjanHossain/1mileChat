import 'package:flutter/material.dart';
import 'package:one_mile_chat/screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../consts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 1,
      width: MediaQuery.of(context).size.width / 1.12,
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
      child: Form(
        key: _formKey,
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
              child: TextFormField(
                validator: (value) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Enter Valid Email';
                  else
                    return null;
                },
                // controller: controller,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
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
              child: TextFormField(
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
                validator: (value) {
                  if (value.length < 8) {
                    return 'wrong password';
                  }
                  return null;
                },
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
              padding: EdgeInsets.only(top: 16),
              focusColor: Colors.red,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  try {
                    final oldUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (oldUser != null) {
                      Navigator.pushNamed(context, MyChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final _formValid = GlobalKey<FormState>();
  String _fullname;
  String _password;
  String _email;
  String _phone;
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
      child: Form(
        key: _formValid,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value.length < 3)
                    return 'Name must be more than 2 charater';
                  else
                    return null;
                },
                onChanged: (value) {
                  setState(() {
                    _fullname = value;
                  });
                },
                textCapitalization: TextCapitalization.words,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Full Name',
                  prefixIcon: Icon(Icons.person, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password can't be empty";
                  } else if (value.length < 8) {
                    return "length must be 9 character";
                  }
                  return null;
                },
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
              child: TextFormField(
                validator: (value) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Enter Valid Email';
                  else
                    return null;
                },
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
              child: TextFormField(
                // controller: controller2,
                validator: (value) {
                  if (value.length < 9) {
                    return 'wrong number';
                  }
                  return null;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Phone',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(
                    () {
                      _phone = value;
                    },
                  );
                },
              ),
            ),
            // form end
            RawMaterialButton(
              padding: EdgeInsets.only(top: 16),
              focusColor: Colors.red,
              onPressed: () async {
                if (_formValid.currentState.validate()) {
                  _formValid.currentState.save();

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, MyChatScreen.id);
                    }
                  } catch (e) {
                    print('Error creating new user: $e');
                  }
                }
                print('$_fullname, $_password, $_email, $_phone');
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
      ),
    );
  }
}
