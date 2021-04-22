import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final String subMessage;
  final IconData icon;
  final double iconSize;
  final double fontSize;

  CenteredMessage(
      this.message, {
        this.subMessage = 'Verifique sua conexão',
        this.icon,
        this.iconSize = 84,
        this.fontSize = 24,
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
              color: Colors.black,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              message,
              style: TextStyle(fontSize: fontSize, color: Colors.blue, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              subMessage,
              style: TextStyle(fontSize: fontSize, color: Colors.lightBlueAccent),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}