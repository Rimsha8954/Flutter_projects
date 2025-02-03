import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("TOP HEADLINES", style: GoogleFonts.anton(letterSpacing: .8, fontSize: 35, color: Colors.red, fontWeight: FontWeight.w900),),
          SizedBox(height: 20,),
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.blue, Colors.red],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: Image.asset(
              "Assets/splash_screen-removebg-preview.png",
            fit: BoxFit.cover,
              height: height * .4,
              width: width,

            ),
          ),
          SizedBox(height: 20,),
          SpinKitFadingCircle(
            color: Colors.grey,
            size: 40,
          ),
        ],
      ),
    );
  }
}
