import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_mile_chat/Widgets/bottomBar.dart';
import 'package:one_mile_chat/Widgets/searchBar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:one_mile_chat/screens/chats.dart';

import '../consts.dart';

class MyChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
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
            child: FaIcon(
              FontAwesomeIcons.cog,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: searchBar(),
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: CardLists(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
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
      bottomNavigationBar: bottomBar(),
    );
  }
}

class CardLists extends StatelessWidget {
  const CardLists({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 2,
        ),
        // color: Colors.pinkAccent,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/rick.png'),
            radius: 30,
          ),
          title: Text('Erick Cartman',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          subtitle: Text('screw you guys, I\'m goin home'),
          trailing: Text('4:20 PM'),
        ),
      ),
    );
  }
}
