import 'package:flutter/material.dart';

class Rowcolum extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(Icons.call),
              SizedBox(height: 10),
              Text('Call'),
            ],
            ),
          Column(
            children: [
              Icon(Icons.share),
              SizedBox(height: 10),
              Text('Share'),
            ],
            ),
          Column(
            children: [
              Icon(Icons.home),
              SizedBox(height: 10),
              Text('Home'),
            ],
            )
        ],
        )
    );
  }
}