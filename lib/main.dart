import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_mile_chat/screens/chats.dart';
import 'package:one_mile_chat/screens/homePage.dart';
import 'package:one_mile_chat/services/auth.dart';
import 'package:provider/provider.dart';

import 'screens/StartPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthServices().user,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}
