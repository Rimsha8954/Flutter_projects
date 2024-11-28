import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: PopupMenuButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.greenAccent,
          ),
          color: Colors.black,
          itemBuilder: (context) => [
            PopupMenuItem(
                child: TextButton(
              child: Text(
                "Projects",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            )),
            PopupMenuItem(
                child: TextButton(
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
            )),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent,
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'Assets/profile photo.png',
                height: 460,
                fit: BoxFit.fill,
              ),
            ),
            //),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.59,
                left: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "About Me",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Hi, I'm Rimsha Ashraf a dedicated undergraduate software student passionate about creating innovative solutions through code in search for opportunity. I recently completed a three-month internship as a Flutter developer, where I honed my skills in designing and implementing user interfaces, mastering state management, and integrating APIs. This hands-on experience not only solidified my understanding of the Flutter framework and Dart programming language but also allowed me to contribute to real-world projects. I thrive on challenges and collaborative learning, and I'm excited to bring my knowledge and enthusiasm for mobile development to future endeavours.",
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 10,
                          //fontWeight: FontWeight.bold
                        ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Hire Me"),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.greenAccent,)),
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.greenAccent,)),
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.github, color: Colors.greenAccent,)),
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.greenAccent,)),
                        IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.google, color: Colors.greenAccent,)),

                      ],),
                  ),

                ],
              ),
            ),
          ],),
      ),
    );
  }
}
