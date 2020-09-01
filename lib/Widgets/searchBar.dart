import 'package:flutter/material.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

// ignore: camel_case_types
class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // color: Colors.blue,
      child: SearchBar(
        onSearch: null,
        onItemFound: null,
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
