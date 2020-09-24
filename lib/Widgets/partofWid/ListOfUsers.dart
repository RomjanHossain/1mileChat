import 'package:flutter/material.dart';
import 'package:one_mile_chat/consts.dart';

class ListOfUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            Image(
              image: AssetImage('images/rick.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    // color: Color(0xFF9BA3EA),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      kcardBoxShadow,
                    ]),
                child: Text(
                  'Romjan D. Hossain',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
