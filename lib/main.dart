import 'package:flutter/material.dart';
import 'package:one_mile_chat/screens/chats.dart';
import 'package:one_mile_chat/screens/homePage.dart';

import 'screens/SignUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
        ),
      ),
      initialRoute: StartPage.id,
      routes: {
        StartPage.id: (context) => StartPage(),
        MyChatScreen.id: (context) => MyChatScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
