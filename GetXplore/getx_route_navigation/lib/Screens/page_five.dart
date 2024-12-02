import 'package:flutter/material.dart';

class PageFive extends StatelessWidget {
  const PageFive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Five', style: TextStyle(fontWeight: FontWeight.w900),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(
                  text: '⚙️ Setup:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Add get to pubspec.yaml and import it: ',
                ),
                TextSpan(
                  text: 'import \'package:get/get.dart\';\n\n',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '🚀 Navigating Between Pages:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                  '👉 Get.to(Page()): Navigate to a new screen.\n👉 Get.back(): Return to the previous screen.\n👉 Get.off(Page()): Replace the current screen with a new one.\n👉 Get.offAll(Page()): Clears all screens and navigates to a new one.\n\n',
                ),
                TextSpan(
                  text: '📤 Passing Arguments:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '🔹 Send: ',
                ),
                TextSpan(
                  text: 'Get.to(Page(), arguments: {\'key\': \'value\'})\n',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '🔹 Receive: ',
                ),
                TextSpan(
                  text: 'var data = Get.arguments;\n\n',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '🗂️ Named Routes:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '''
🔹 Define Routes:
GetMaterialApp(
  initialRoute: '/home',
  getPages: [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/details', page: () => DetailsPage()),
  ],
);\n''',
                  style: TextStyle(fontFamily: 'monospace'),
                ),
                TextSpan(
                  text: '🔹 Navigate: ',
                ),
                TextSpan(
                  text: 'Get.toNamed(\'/details\');\n\n',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: '🛡️ Middleware:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                  'Use middlewares to control access or modify behavior during navigation. Example: Checking authentication before navigating to a page.\n\n',
                ),
                TextSpan(
                  text: '🌟 No Context Needed:\n',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'GetX navigation does not require BuildContext.\n',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
