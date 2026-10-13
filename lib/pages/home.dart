import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
               child: Text('Masuk Profile')
            ),

            //LIST
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-basic');
              },
               child: Text('Masuk List')
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-builder');
              },
               child: Text('Masuk List builder')
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-horizontal');
              },
               child: Text('Masuk List horizontal')
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-kostum');
              },
               child: Text('Masuk List kostum')
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-terpisah');
              },
               child: Text('Masuk List terpisah')
            ),
            const SizedBox(height: 15),

            //Grid
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid');
              },
               child: Text('Masuk grid')
            ),

            //LATIHAN
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list-Screen');
              },
               child: Text('Masuk List')
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid-view');
              },
               child: Text('Masuk Grid Product')
            ),
          ],
        ),
      )
    );
  }
}