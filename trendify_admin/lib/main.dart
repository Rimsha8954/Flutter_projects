import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trendify_admin/Controller/home_page_controller.dart';

import 'Pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAfKq34CZo4j7HCarzi8V1yJ-GMP5ScFNI',
        appId: '1:731931779581:android:6782f3b84279c10a247994',
        messagingSenderId: '731931779581',
        projectId: 'trendify-admin-4a18d',
        storageBucket: 'trendify-admin-4a18d.appspot.com',
      )
  )
      : await Firebase.initializeApp();
  Get.put(HomePageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: HomePage(),

    );
  }
}
