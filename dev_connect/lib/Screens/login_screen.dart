import 'package:dev_connect/Screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/auth_controller.dart';
import '../Reuseable Widgets/custom_textfield.dart';


class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController _authController = Get.find();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.indigo], // Neon gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: AssetImage(
                      'Assets/Dev_Connect_Logo.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                color: Colors.green,
              ),
              ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email,
                    ),
                    CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      controller: _passwordController,
                      isPassword: true,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          _authController.login(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                        child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignupScreen());
                      },
                      child: const Text('Dont you have an account! Signup Now', style: TextStyle(color: Colors.indigo, ),),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
