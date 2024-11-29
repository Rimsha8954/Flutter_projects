import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          prefixIconColor: Colors.black,
          filled: true,
          fillColor: Colors.white, // Adjust for your theme
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:const BorderSide(color: Colors.black,width: 2),
            borderRadius: BorderRadius.circular(20,),

          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        style: const TextStyle(
          color: Colors.black, // Adjust for your theme
        ),
      ),
    );
  }
}
