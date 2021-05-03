import 'package:flutter/material.dart';

import 'package:proyecto_primer_dep/src/pages/home_pages.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Widgets App',

      debugShowCheckedModeBanner: false,

      home: HomePageTemp(),

    );

  }

}
