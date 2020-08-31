import 'package:flutter/material.dart';

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
        // leading: Icon(
        //   Icons.book,
        //   color: Colors.transparent,
        // ),
        title: Text(
          'holy',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.contact_phone),
          ),
          Icon(Icons.location_city),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       flex: 8,
            //       child: Center(
            //         child: Text(
            //           'holy',
            //           style: TextStyle(
            //             fontSize: 35,
            //             fontWeight: FontWeight.w300,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Icon(Icons.contact_phone),
            //     ),
            //     Expanded(
            //       child: Icon(Icons.location_city),
            //     ),
            //   ],
            // ),
            Text(
              'holy',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w300,
              ),
            ),
            bottomBar(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: () {
            print('btn clicked');
          },
          child: Icon(Icons.location_on),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class bottomBar extends StatelessWidget {
  const bottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF2D2F44),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.message,
            color: Colors.blue,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
