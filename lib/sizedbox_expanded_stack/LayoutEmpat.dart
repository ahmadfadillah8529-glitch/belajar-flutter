import 'package:flutter/material.dart';

class Profilewidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 140,
              color: Colors.grey[300],
            ),
            Positioned(
              bottom: -60,
              left: 20,
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("https://www.shutterstock.com/editorial/image-editorial/NdTdg54eM6TdgcwbNTAyMg==/avenged-sevenfold---m-shadows-matthew-sanders-440nw-5841906h.jpg"),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.all(20),
          child:Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ahmad Fadilah", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("XII RPL 1", style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Follow",
                  ),
              )
            ],
          )
        )
      ],
    );
  }
}