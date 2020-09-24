import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:one_mile_chat/Widgets/partofWid/chatLists.dart';
import 'package:one_mile_chat/Widgets/components/mySpeedDail.dart';
import 'package:one_mile_chat/screens/signUpPage/StartPage.dart';
import 'package:one_mile_chat/screens/listofUserOM/milePage.dart';
import 'package:one_mile_chat/screens/noti/noti.dart';
import 'package:one_mile_chat/screens/profilePage/profile.dart';
import 'package:one_mile_chat/services/auth.dart';
import '../consts.dart';

class MyChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';

  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final AuthServices auth = AuthServices();

  int currentIndex = 0;
  PageController _pageController;
  final _appbarText = [
    'One Mile',
    'Chats',
    'Notifications',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _onChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

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
          '${_appbarText[currentIndex]}',
          style: kappbarText,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.addressBook, color: Colors.black),
              onPressed: null),
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.signOutAlt,
              ),
              onPressed: () async {
                await auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, StartPage.id, (route) => false);
              }),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onChange,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OneMilePage(),
          ChatLists(),
          Notifications(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: MySpeedDail(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[800],
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.headset,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Search',
                ),
              ],
              selectedIndex: currentIndex,
              onTabChange: _onItemTapped),
        ),
      ),
    );
  }
}
