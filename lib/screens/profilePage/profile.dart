import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:one_mile_chat/consts.dart';
import 'package:one_mile_chat/services/curd.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  static String id = 'profile';
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                kcardBoxShadow,
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.photoURL),
                  radius: 70,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      user.displayName,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  subtitle: Center(child: Text(user.email)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      // height: 50,
                      child: ListTile(
                        subtitle: Center(child: Text('status')),
                        title: Center(
                          child: Text(
                            'Single',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      // height: 50,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            'Male',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                        subtitle: Center(child: Text('Gender')),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      onPressed: () async {
                        // CurdServide().createUserData(user);
                        CurdServide().updateUserData(user);
                      },
                      child: Icon(Icons.mail),
                      backgroundColor: Colors.indigoAccent,
                    ),
                    FloatingActionButton(
                      onPressed: null,
                      child: FaIcon(FontAwesomeIcons.atom),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.green[300],
                      onPressed: null,
                      child: Icon(
                        Icons.phone,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              ListTile(
                title: Text('99 Meadow City'),
                subtitle: Text('Address'),
              ),
              ListTile(
                title: Text('1216'),
                subtitle: Text('Zip Code'),
              ),
              ListTile(
                title: Text('Dhaka'),
                subtitle: Text('City'),
              ),
              ListTile(
                title: Text('Bangladesh'),
                subtitle: Text('Country'),
              ),
              ListTile(
                title: Text('99 Meadow City'),
                subtitle: Text('Address'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
