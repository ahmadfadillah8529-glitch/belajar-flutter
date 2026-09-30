import 'package:flutter/material.dart';

class Latihansatu extends StatelessWidget {
  const Latihansatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:200,
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
      child: Center(
        child: Container(
          alignment: Alignment.topCenter,
          child: Text("SMK ASSALAAM BANDUNG", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
        ),
      ),
    );
  }
}