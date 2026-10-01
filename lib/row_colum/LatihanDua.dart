import 'package:flutter/material.dart';

class Latihandua extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height:300,
        width: 500,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nama : Ahmad Fadilah"),
                SizedBox(height: 10),
                Text("Kelas : XII RPL 1"),
                Text("Nis :123456789"),
              ],
            ),
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
              image: NetworkImage("https://www.shutterstock.com/editorial/image-editorial/NdTdg54eM6TdgcwbNTAyMg==/avenged-sevenfold---m-shadows-matthew-sanders-440nw-5841906h.jpg"),
              fit: BoxFit.cover,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}