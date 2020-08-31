import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  final height;

  const TopPage({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Colors.blue,
      ),
      height: height * 0.5,
    );
  }
}

// class Button extends StatelessWidget {
//   const Button({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(onPressed: (){});
//   }
// }
