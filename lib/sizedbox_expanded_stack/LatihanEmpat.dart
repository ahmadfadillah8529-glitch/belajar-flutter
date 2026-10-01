import 'package:flutter/material.dart';

class Latihanempat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
        child: Container(
        height: 110,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage("https://www.shutterstock.com/editorial/image-editorial/NdTdg54eM6TdgcwbNTAyMg==/avenged-sevenfold---m-shadows-matthew-sanders-440nw-5841906h.jpg"),
              )
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ahmad Fadilah",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "XII RPL 1",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        ),
        ),
      ],
    );
  }
}
