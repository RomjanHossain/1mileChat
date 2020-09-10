import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 50,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 3,
      ),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(
          color: Colors.red,
          width: 4,
        )));

const kappbarText = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.w300,
  color: Colors.black,
);
