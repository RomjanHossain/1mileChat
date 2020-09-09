import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('just pressed');
      },
      onLongPress: () {
        print('long pressed');
      },
      child: FaIcon(
        FontAwesomeIcons.telegramPlane,
        color: Colors.white,
      ),
      fillColor: Colors.greenAccent[700],
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 40,
        width: 40,
      ),
    );
  }
}
