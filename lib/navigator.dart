import 'package:flutter/material.dart';
import 'package:flutter_ahmad_12rpl1/latihan_grid_list/Grid.dart';
import 'package:flutter_ahmad_12rpl1/latihan_grid_list/ListScreen.dart';
import 'package:flutter_ahmad_12rpl1/latihan_grid_list/detail_screen.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:(context) {
                  return (ArticleListScreen());
                },
              ),
            );
          },
          child: Text(
            "List Basic"
          ),
        ),
      ],
    );
  }
}