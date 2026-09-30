import 'package:flutter/material.dart';

class Latihansatu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height:400,
        width: 300,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green[300],
           borderRadius: BorderRadius.circular(15),
            border: Border.all(
            color: Colors.green[700]!,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
              image: DecorationImage(
              image: NetworkImage("https://www.shutterstock.com/editorial/image-editorial/NdTdg54eM6TdgcwbNTAyMg==/avenged-sevenfold---m-shadows-matthew-sanders-440nw-5841906h.jpg"),
              fit: BoxFit.cover,
              ),
              ),
            ),
            Column(
              children: [
                Text("Nama : Ahmad Fadilah"),
                Text("Kelas : XII RPL 1"),
                Text("Nis :123456789"),
              ],
            )
          ],
        ),
      ),
    );
  }
}