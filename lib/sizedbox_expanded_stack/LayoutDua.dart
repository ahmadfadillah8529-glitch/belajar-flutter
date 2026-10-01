import 'package:flutter/material.dart';

class Layoutdua extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.circular(10),
          ),
          child:Icon( 
            Icons.image,
            size: 60,
            color: Colors.grey,
          )
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Text("-20%")
          )
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Icon(
            Icons.favorite_border,
          )
        ),
      ],
    );
  }
}