import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

// ignore: camel_case_types
class searchBar extends StatefulWidget {
  @override
  _searchBarState createState() => _searchBarState();
}

// ignore: camel_case_types
class _searchBarState extends State<searchBar> {
  final FirebaseFirestore _ins = FirebaseFirestore.instance;
  QuerySnapshot searchResults;
  getUsers(String data) async {
    final QuerySnapshot users = await _ins
        .collection('Users')
        .where('displayname', isGreaterThanOrEqualTo: data)
        .get();
    setState(() {
      searchResults = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // color: Colors.blue,
      child: SearchBar(
        onSearch: null,
        onItemFound: null,
        buildSuggestion: null,
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w200,
        ),
        icon: Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        searchBarStyle: SearchBarStyle(
          backgroundColor: Colors.grey[100],
          borderRadius: BorderRadius.circular(30),
          padding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
