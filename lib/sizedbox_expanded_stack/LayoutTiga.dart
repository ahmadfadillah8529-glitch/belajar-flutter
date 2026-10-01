import 'package:flutter/material.dart';

class Kartudashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.red[300],
              alignment: Alignment.center,
              child: Text("Pemasukan"),
            )
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.green[300],
              alignment: Alignment.center,
              child: Text("Pengeluaran"),
            )
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text("Saldo"),
            )
          ),
        ],
      ),
    );
  }
}