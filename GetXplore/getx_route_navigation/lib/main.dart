import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_x_plore/Screens/home_page.dart';

import 'Screens/page_four.dart';
import 'Screens/page_three.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),

      //Navigate using route name. if you have a complex app and you want to pass based on different number then use this below method:
      getPages: [
        GetPage(name: '/course-page', page: () => const PageThree()),
        GetPage(name: '/more-page/:data', page: () => const PageFour()),
        // :/data this is the key name DATA the place where we click and we will generate a random number you can pass directly over there. and retrieve it later on in another widget
      ],
    );
  }
}
