import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_plore/Screens/page_five.dart';

class PageFour extends StatelessWidget {
  const PageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.to(() => PageFive());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300], // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              elevation: 2, // Shadow effect
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
            child: const Text(
              'Page Five',
              style: TextStyle(
                color: Colors.black54, // Text color
                fontWeight: FontWeight.w900, // Font weight
                fontSize: 16, // Font size
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(child: Text("The Updated value is " + Get.parameters['data']!)),
        ],
      ),
    );
  }
}
