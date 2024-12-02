import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_plore/Screens/home_page.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                //Using traditional method you always have to pass (context) which could be annoying.
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300], // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                elevation: 2, // Shadow effect
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
              child: const Text(
                'Home',
                style: TextStyle(
                  color: Colors.black54, // Text color
                  fontWeight: FontWeight.w900, // Font weight
                  fontSize: 16, // Font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
