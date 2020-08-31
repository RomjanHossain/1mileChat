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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.home),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    print('signIn clicked');
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    print('signUp clicked');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
