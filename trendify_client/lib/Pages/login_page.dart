import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_client/Controller/signin_signup_contoller.dart';
import 'package:trendify_client/Pages/Signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 30,),
          color: Colors.greenAccent.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome Back!", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),),
              SizedBox(height: 20),
              TextField(
                controller: ctrl.loginNumber,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    "Mobile Number",
                  ),
                  hintText: 'Enter your Mobile Number',
                  prefixIcon: Icon(Icons.phone_android),
                ),
              ),

              SizedBox(height: 40,),
              ElevatedButton(
                onPressed: () {
                  ctrl.loginWithNumber();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 20, color: Colors.greenAccent.shade100),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20), // Rounded corners
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Donot have an Account!",
                    style: TextStyle(color: Colors.black),),

                  TextButton(
                      onPressed: () {
                        Get.to(SignupPage());
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
