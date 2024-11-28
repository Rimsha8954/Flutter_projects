import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trendify_client/Controller/signin_signup_contoller.dart';
import 'package:trendify_client/Pages/home_page.dart';
import 'package:trendify_client/Pages/login_page.dart';

import '../Reuseabl_Widgets/otp_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          color: Colors.greenAccent.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create Your Account",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              TextField(
                controller: ctrl.UserName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: Text(
                    "Name",
                  ),
                  hintText: 'Enter your Name',
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ctrl.UserNumber,
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
              SizedBox(
                height: 40,
              ),
              OtpTextField(
                otpController: ctrl.otpController,
                visble: ctrl.otpFieldShow, onComplete: (OTP) {
                  ctrl.otpEnter = int.tryParse(OTP ?? '0000' );
              },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (ctrl.otpFieldShow) {
                    ctrl.addUser();
                    Get.to(HomePage());
                  } else {
                    ctrl.sendOtp();
                  }
                },
                child: Text(
                  ctrl.otpFieldShow ? "Register" : "Send OTP",
                  style: TextStyle(
                      fontSize: 20, color: Colors.greenAccent.shade100),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: Text(
                        "Signin",
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
