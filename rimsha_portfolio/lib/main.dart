import 'package:flutter/material.dart';
import 'Pages/about.dart';
import 'Pages/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home': (context) => const MyHome(),
      'about': (context) => const About(),
    },
  ));
}
