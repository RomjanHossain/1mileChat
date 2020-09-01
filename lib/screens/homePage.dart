import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_mile_chat/Widgets/bottomBar.dart';
import 'package:one_mile_chat/Widgets/searchBar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MyChatScreen extends StatefulWidget {
  static const String id = 'chatScreen';
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.book,
          color: Colors.transparent,
        ),
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
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
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: FaIcon(
              FontAwesomeIcons.cog,
              color: Colors.black,
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
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage('images/rick.png'),
                                radius: 30,
                              ),
                              title: Text('Erick Cartman'),
                              subtitle: Text('screw you guys, I\'m goin home'),
                              trailing: FaIcon(FontAwesomeIcons.addressBook),
                            ),
                          ),
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
