import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_x_plore/Screens/page_one.dart';
import 'package:get_x_plore/Screens/page_two.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF00224D),
                  Color(0xFFD91656),
                  Color(0xFF640D5F)
                ]),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
            child: const Center(
                child: Text(
              "Welcome to GetXplore",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white70,
                border: Border.all(width: 1, color: Colors.black),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 12.0, left: 15),
                child: Text(
                  "Search GetX..",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          RichText(
            text: TextSpan(
                text: 'Learn GetX',
                recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => PageOne()),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                )),
          ),
          RichText(
            text: TextSpan(
                text: 'Explore GetX',
                recognizer: TapGestureRecognizer()..onTap = () => Get.to(
                        () => PageTwo(),
                        arguments: {
                          'price': Random().nextInt(10000).toString(),
                          'text': 'The course price is USD: ',
                        }
                ),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Navigate to named routes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 266.3,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF00224D),
                  Color(0xFFD91656),
                  Color(0xFF640D5F)
                ]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    //toNamed: bcz you are using named route rather than page
                    Get.toNamed(
                        '/course-page',
                      arguments: {
                          'price': Random().nextInt(1000).toString(),
                      }
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    elevation: 2, // Shadow effect
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
                  child: const Text(
                    'Course',
                    style: TextStyle(
                      color: Colors.black54, // Text color
                      fontWeight: FontWeight.w900, // Font weight
                      fontSize: 16, // Font size
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () {
                      Get.toNamed('/more-page/${Random().nextInt(20000).toString()}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300], // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    elevation: 2, // Shadow effect
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),),
                  child: const Text(
                    'More',
                    style: TextStyle(
                      color: Colors.black54, // Text color
                      fontWeight: FontWeight.w900, // Font weight
                      fontSize: 16, // Font size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
