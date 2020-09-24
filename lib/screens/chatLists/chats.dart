import 'package:flutter/material.dart';
import 'package:one_mile_chat/Widgets/partofWid/chatbody.dart';
import 'package:one_mile_chat/Widgets/components/sendmessagebutton.dart';

import '../../consts.dart';

class ChatScreen extends StatefulWidget {
  static const id = 'id';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 40,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Erick',
          style: kappbarText,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SendMessageButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChatBody(),
          sendMessage(),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class sendMessage extends StatefulWidget {
  @override
  _sendMessageState createState() => _sendMessageState();
}

// ignore: camel_case_types
class _sendMessageState extends State<sendMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15,
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: TextField(
          decoration: kTextFieldDecoration.copyWith(
            contentPadding: EdgeInsets.only(left: 15),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ),
    );
  }
}
