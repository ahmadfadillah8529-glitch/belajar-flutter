import 'package:flutter/material.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/ColumWidget.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/LatihanDua.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/RowColumWidget.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/RowWidget.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/LatihanSatu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ), 
         body: Latihandua(),
      ), //Scaffold
    ); //MaterialApp
  }
}

class HelloWidget extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Text("Hello, Flutter!", style: TextStyle(
       fontSize: 24,
       fontWeight: FontWeight.bold,
       color: const Color.fromARGB(255, 2, 244, 196),
       backgroundColor: Colors.black ,
     )),
    );
  }
}