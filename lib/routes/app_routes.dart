import 'package:flutter/material.dart';
import 'package:flutter_ahmad_12rpl1/form/input_form.dart';
import 'package:flutter_ahmad_12rpl1/grid/GridView.dart';
import 'package:flutter_ahmad_12rpl1/latihan_form/input_screen.dart';
import 'package:flutter_ahmad_12rpl1/latihan_grid_list/Grid.dart';
import 'package:flutter_ahmad_12rpl1/latihan_grid_list/ListScreen.dart';
import 'package:flutter_ahmad_12rpl1/list/listView.dart';
import 'package:flutter_ahmad_12rpl1/list/listViewBuilder.dart';
import 'package:flutter_ahmad_12rpl1/list/listViewHorizontal.dart';
import 'package:flutter_ahmad_12rpl1/list/listViewKostum.dart';
import 'package:flutter_ahmad_12rpl1/list/listViewTerpisah.dart';
import 'package:flutter_ahmad_12rpl1/pages/about.dart';
import 'package:flutter_ahmad_12rpl1/form/input_form.dart';
import 'package:flutter_ahmad_12rpl1/pages/home.dart';
import 'package:flutter_ahmad_12rpl1/tokoWisata/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';

  //list
  static const listView = '/list-basic';
  static const listViewBuilder = '/list-builder';
  static const listViewHorizontal = '/list-horizontal';
  static const listViewKostum = '/list-kostum';
  static const listViewTerpisah = '/list-terpisah';

  //grid
  static const grid = '/grid';

  //latihan
  static const ListScreen = '/list-Screen';
  static const gridview = '/grid-view';

  //Form
  static const formPage = '/form-page';

  static const formLatihan = '/form-latihan';

  static const tiket = '/tiket-wisata';

  static Map<String, WidgetBuilder> routes= {
    home:(context) => HomePage(),
    about:(context) => About(),

    //list
    listView:(context) => Listview(),
    listViewBuilder:(context) => Listviewbuilder(),
    listViewHorizontal:(context) => Listviewhorizontal(),
    listViewKostum:(context) => Listviewkostum(),
    listViewTerpisah:(context) => Listviewterpisah(),

    //grid
    grid:(context) => Gridview(),

    //latihan
    ListScreen:(context) => ArticleListScreen(),
    gridview:(context) => GridProductPage(),

    //Form
    formPage:(context) => BelajarForm(),

    formLatihan:(context) => FormLatihan(),

    tiket:(context) => TiketHome(),
  };
}