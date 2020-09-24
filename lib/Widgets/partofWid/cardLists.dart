import 'package:flutter/material.dart';
import 'package:one_mile_chat/screens/chatLists/chats.dart';

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
