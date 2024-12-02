import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  Get.arguments['text'] ?? 'This course is for free',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Center(
                child: Text(
                  //This method is very easy but with the traditional method like passing arguments could be very difficult, you have to define a separate class for this and you have to write alot of code for it.
                  Get.arguments['price'] ?? 'Exploration Page',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
