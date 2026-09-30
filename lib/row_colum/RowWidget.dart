import 'package:flutter/material.dart';

class Rowwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Isi Row 1'),
        Text('Isi Row 2'),
        Text('Isi Row 3'),
      ]
    );

  }
}