import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Course Page',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("${"This course price is " + Get.arguments['price']}\$", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),)),
        ],
      ),
    );
  }
}
