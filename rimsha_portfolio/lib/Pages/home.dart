import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
//   final Shader headerGradient =
//       LinearGradient(colors: <Color>[Colors.pink, Colors.purple])
//           .createShader(Rect.fromLTWH(0, 0, 200, 70));
//
//   final Shader highlightGradient =
//       LinearGradient(colors: <Color>[Colors.green, Colors.lime])
//           .createShader(Rect.fromLTWH(0, 0, 200, 70));
//
//   final Shader overallGradient = LinearGradient(colors: <Color>[
//     Colors.indigo,
//     Colors.purple,
//     Colors.pink,
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//   ]).createShader(Rect.fromLTWH(0, 0, 200, 70));
//

  mySkills(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.greenAccent),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            type,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  mySpecialization(icon, text) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(10),
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.greenAccent, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                "About",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'about');
              },
            )),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.black, Colors.greenAccent],
            center: Alignment.topCenter,
            radius: 3.5,
          ),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  // child: ShaderMask(
                  //   shaderCallback: (bound) {
                  //     return LinearGradient(
                  //             begin: Alignment.center,
                  //             end: Alignment.bottomCenter,
                  //             colors: [Colors.lime, Colors.white])
                  //         .createShader(
                  //             Rect.fromLTRB(0, 0, bound.width, bound.height));
                  // },
                  //blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'Assets/profile photo.png',
                    height: 450,
                    //fit: BoxFit.fill,
                  ),
                ),
                //),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rimsha Ashraf",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("Flutter Developer",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          builder: (context, state) {
            return Container(
              color: Colors.black,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mySkills('1+', 'Experience'),
                        mySkills('3', 'Certifications'),
                        mySkills('10+', 'Projects'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Specialized In",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpecialization(
                                FontAwesomeIcons.android, 'Flutter'),
                            mySpecialization(FontAwesomeIcons.github, 'Github'),
                            mySpecialization(
                                FontAwesomeIcons.database, 'Firebase'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            mySpecialization(
                                FontAwesomeIcons.webflow, 'Webflow'),
                            mySpecialization(
                                FontAwesomeIcons.video, 'Videoeditor'),
                            mySpecialization(FontAwesomeIcons.figma, 'Figma'),
                          ],),
                      ],)
                  ],),
              ),
            );
          },
        ),
      ),
    );
  }
}
// Scaffold(
// backgroundColor: Colors.black,
// appBar: AppBar(
// leading: PopupMenuButton(
// icon: const Icon(Icons.menu),
// color: Colors.white,
// itemBuilder: (context) => [
// PopupMenuItem(
// child: TextButton(
// child: Text(
// "Projects",
// style: TextStyle(color: Colors.white),
// ),
// onPressed: () {},
// )),
// PopupMenuItem(
// child: TextButton(
// child: Text(
// "About",
// style: TextStyle(color: Colors.white),
// ),
// onPressed: () {},
// )),
// ],
// ),
// ),
// body: Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.bottomRight,
// colors: [Colors.pinkAccent.shade100, Colors.purpleAccent]),
// ),
// child: SlidingSheet(
// color: Colors.white,
// elevation: 8,
// cornerRadius: 30,
// ),
// ),
// // );
