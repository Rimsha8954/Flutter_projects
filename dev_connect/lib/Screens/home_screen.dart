import 'dart:io';
import 'package:dev_connect/Screens/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/auth_controller.dart';
import '../Controller/user_controller.dart';
import 'contact_form_screen.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.find<UserController>();
  final AuthController _authController = Get.find();

  bool _showAboutMe = false;

  void _toggleAboutMe() {
    setState(() {
      _showAboutMe = !_showAboutMe;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Obx(() => UserAccountsDrawerHeader(
      decoration: const BoxDecoration(color: Colors.white),
      accountName: Text(
        userController.userName.value,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      accountEmail: Text(
        userController.userEmail.value,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      currentAccountPicture: GestureDetector(
        onTap: () {
          userController.pickImage(); // Pick image when tapped
        },
        child: CircleAvatar(
          backgroundColor: Colors.black54,
          backgroundImage: userController.userImage.value.isNotEmpty
              ? FileImage(File(userController.userImage.value))
              : null, // Display the image if available
          child: userController.userImage.value.isEmpty
              ? Text(
            userController.userName.value.isNotEmpty
                ? userController.userName.value[0]
                : '',
            style: const TextStyle(fontSize: 40.0, color: Colors.white),
          )
              : null,
        ),
      ),
    )),

    Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.black,),// for Left
                title: const Text('Home', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(Icons.work, color: Colors.black,),
                title: const Text('Projects', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                onTap: () {
                  Get.to(ProjectScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(Icons.contact_page, color: Colors.black,),
                title: const Text('Contact Form', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                onTap: () {
                  Get.to(ContactFormScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.black,),
                title: const Text('Logout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                onTap: () {
                  _authController.signOut();
                },
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.black,
                    Colors.indigo,
                  ])
          ),
        ),
      ),
      body: Stack(
        children: [
          // Profile Section with Gradient Background
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.indigo], // Neon gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://www.pngfind.com/pngs/m/29-298536_anonymous-clipart-female-blank-profile-picture-girls-hd.png'), // Replace with your profile picture URL
                  ),
                  const Text(
                    'Rimsha Ashraf',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const Text(
                    'Islamabad, Pakistan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white54,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _toggleAboutMe,
                    child: Text(_showAboutMe ? 'Hide Details' : 'Show Details', style: const TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),
          // About Me Section as a Popup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _showAboutMe ? MediaQuery.of(context).size.height / 3 : MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height / 2 +100,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.black], // Neon gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Hello! I’m Rimsha Ashraf, a passionate and dedicated Flutter developer with a Bachelors degree in Software Engineering. I thrive on crafting elegant and functional applications that enhance user experiences and solve real-world problems.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Expertise',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'I specialize in Flutter development, focusing on creating responsive and intuitive mobile applications. My expertise extends to integrating Firebase for seamless backend services and utilizing modern state management solutions like GetX to build scalable and maintainable apps.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Experience',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'With hands-on experience in developing and deploying various applications, I’ve worked on projects ranging from e-commerce platforms to personal portfolio apps. My recent endeavors include:\n Trendify: A comprehensive app with separate interfaces for admins and clients, showcasing my ability to handle complex user interactions.\n Veggie Vault: An e-commerce app designed to streamline the shopping experience for fruits and vegetables, featuring product management and cart functionalities.\n Custom Portfolio App: An application highlighting my skills and projects, integrating Firebase for real-time data management and user authentication.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                  
                      SizedBox(height: 20),
                      Text(
                        'Education',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "I completed my Bachelor’s degree in Software Engineering, where I honed my skills in software development, project management, and problem-solving. My academic background laid the foundation for my practical experience and continuous learning in the tech industry.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                  
                      SizedBox(height: 20),
                      Text(
                        'Vision',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'I’m committed to delivering high-quality software solutions that meet clients needs and exceed their expectations. My goal is to stay at the forefront of technology trends and contribute to innovative projects that make a difference.\n \n Feel free to reach out if you’re interested in collaborating or if you have any questions about my work. I’m always eager to connect with like-minded professionals and explore new opportunities.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
