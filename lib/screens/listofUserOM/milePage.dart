import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:one_mile_chat/Widgets/partofWid/ListOfUsers.dart';
import 'package:one_mile_chat/Widgets/components/searchBar.dart';

class OneMilePage extends StatefulWidget {
  @override
  _OneMilePageState createState() => _OneMilePageState();
}

class _OneMilePageState extends State<OneMilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: searchBar(),
        ),
        Text('People Within One Mile'),
        Expanded(
          child: AnimationLimiter(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                100,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: ListOfUsers(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
