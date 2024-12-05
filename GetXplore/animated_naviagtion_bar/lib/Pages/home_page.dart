import 'package:animated_naviagtion_bar/Controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Home',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 20),
            _buildHorizontalScrollSection(),
            const SizedBox(height: 20),
            _buildGridSection(),
          ],
        ),
      ),
    );
   }

   Widget _buildWelcomeSection() {
     return Container(
       width: double.infinity,
       padding: const EdgeInsets.all(20),
       color: Colors.green[100],
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             "Welcome, User!",
             style: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.bold,
               color: Colors.green[800],
             ),
           ),
           const SizedBox(height: 10),
           Text(
             "Explore your dashboard, manage tasks, and connect with users.",
             style: TextStyle(fontSize: 16, color: Colors.green[700]),
           ),
         ],
       ),
     );
   }

   Widget _buildHorizontalScrollSection() {
     final items = List.generate(5, (index) => "Feature ${index + 1}");
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const Padding(
           padding: EdgeInsets.symmetric(horizontal: 20),
           child: Text(
             "Featured Items",
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
           ),
         ),
         const SizedBox(height: 10),
         SizedBox(
           height: 150,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             padding: const EdgeInsets.only(left: 20),
             itemCount: items.length,
             itemBuilder: (context, index) {
               return Container(
                 width: 120,
                 margin: const EdgeInsets.only(right: 15),
                 decoration: BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.circular(15),
                 ),
                 child: Center(
                   child: Text(
                     items[index],
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               );
             },
           ),
         ),
       ],
     );
   }

   Widget _buildGridSection() {
     final items = List.generate(6, (index) => "Item ${index + 1}");
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const Text(
             "Your Items",
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
           ),
           const SizedBox(height: 10),
           GridView.builder(
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             itemCount: items.length,
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10,
             ),
             itemBuilder: (context, index) {
               return Container(
                 decoration: BoxDecoration(
                   color: Colors.green[300],
                   borderRadius: BorderRadius.circular(15),
                 ),
                 child: Center(
                   child: Text(
                     items[index],
                     style: const TextStyle(
                       color: Colors.white,
                       fontSize: 16,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               );
             },
           ),
         ],
       ),
    );
  }
}
