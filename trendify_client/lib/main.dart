import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trendify_client/Controller/purchase_controller.dart';
import 'package:trendify_client/Controller/signin_signup_contoller.dart';
import 'package:trendify_client/Pages/login_page.dart';

import 'Controller/home_controller.dart';

void main() async{
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAfKq34CZo4j7HCarzi8V1yJ-GMP5ScFNI',
        appId: '1:731931779581:android:5461f4204f612d24247994',
        messagingSenderId: '731931779581',
        projectId: "trendify-admin-4a18d",
        storageBucket: "trendify-admin-4a18d.appspot.com",
      )
  )
      : await Firebase.initializeApp();
  Get.put(SigninController());
  Get.put(HomeController());
  Get.put(PurchaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
     home: LoginPage(),
    );
  }
}

