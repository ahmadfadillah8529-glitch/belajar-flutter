import 'package:flutter/material.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/ColumWidget.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/LatihanDua.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/RowColumWidget.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/RowWidget.dart';
import 'package:flutter_ahmad_12rpl1/row_colum/LatihanSatu.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/LatihanEmpat.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/LayoutDua.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/LayoutEmpat.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/LayoutSatu.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/LayoutTiga.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/SizedBoxWidget.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/StackWidget.dart';
import 'package:flutter_ahmad_12rpl1/sizedbox_expanded_stack/expandedWidget.dart';

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
         body: Latihanempat(),
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