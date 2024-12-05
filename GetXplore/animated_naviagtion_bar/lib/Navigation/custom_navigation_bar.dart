import 'package:animated_naviagtion_bar/Pages/message_page.dart';
import 'package:animated_naviagtion_bar/Pages/home_page.dart';
import 'package:animated_naviagtion_bar/Pages/counter_page.dart';
import 'package:animated_naviagtion_bar/Pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/nav_controller.dart';

class CustomNavigationBar extends StatelessWidget {
   CustomNavigationBar({super.key});

   final NavController navController = Get.put(NavController());

   final List<Widget> _screens = [
     HomePage(),
     UsersPage(),
     MessagePage(),
     CounterPage(),
   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Observe the current index using Obx
      body: Obx(() => _screens[navController.selectedIndex.value]),

      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: (index) => navController.updateIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
              items: [
                _buildNavItem(Icons.home, "Home", 0),
                _buildNavItem(Icons.group, "Users", 1),
                _buildNavItem(Icons.message, "Message", 2),
                _buildNavItem(Icons.add, "Counter", 3),
              ],
      ),
      ),
    );

  }
   BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
     final isSelected = navController.selectedIndex.value == index;
     return BottomNavigationBarItem(
       icon: AnimatedContainer(
         duration: Duration(milliseconds: 300),
         curve: Curves.easeInOut,
         child: Icon(
           icon,
           size: isSelected ? 30 : 24, // Larger size for the selected icon
           color: isSelected ? Colors.green : Colors.grey,
         ),
       ),
       label: label,
     );
   }
}
