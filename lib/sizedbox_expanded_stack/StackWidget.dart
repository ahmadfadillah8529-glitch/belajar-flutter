import 'package:flutter/material.dart';

class Stackwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.lightGreenAccent,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          )
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Text(
            "Label",
            ),
          ),
        Positioned(
          bottom: 30,
          left: 30,
          right: 30,
          top: 30,  
          child: Container(
            color: Colors.red,
          ),
          )
      ],
    );
  }
}