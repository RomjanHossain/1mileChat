import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_mile_chat/Widgets/bottomBar.dart';

import 'package:one_mile_chat/Widgets/chatLists.dart';

import 'package:one_mile_chat/screens/StartPage.dart';
import 'package:one_mile_chat/screens/profile.dart';

import '../consts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';

  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final _auth = FirebaseAuth.instance;
  int currentIndex = 0;
  final _pageOptions = [
    ChatLists(),
    ChatLists(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: Icon(
          Icons.book,
          color: Colors.transparent,
        ),
        title: Text(
          'Chats',
          style: kappbarText,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: FaIcon(
              FontAwesomeIcons.addressBook,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: GestureDetector(
              onTap: () async {
                await _auth.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(StartPage.id, (route) => false);
              },
              child: FaIcon(
                FontAwesomeIcons.signOutAlt,
              ),
            ),
          ),
        ],
      ),
      body: _pageOptions[currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          print('btn clicked');
        },
        child: FaIcon(
          FontAwesomeIcons.locationArrow,
          color: Colors.blue,
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
