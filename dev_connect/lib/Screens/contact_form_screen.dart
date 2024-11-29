import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Reuseable Widgets/custom_textfield.dart';

class ContactFormScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Contact Form", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.indigo], // Neon gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: 'Name',
                hintText: 'Enter your Name',
                controller: _nameController,
                keyboardType: TextInputType.name,
                prefixIcon: Icons.person,
              ),
              CustomTextField(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  maxLines: 4,
                  controller: _messageController,
                  decoration: InputDecoration(
                    labelText: "Message",
                    labelStyle: const TextStyle(
                        color: Colors.black
                    ),
                    hintText: "Share your Idea",
                    prefixIcon: const Icon(Icons.message, color: Colors.black,),
                    filled: true,
                    fillColor: Colors.white, // Adjust for your theme

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20,),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black54, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.black54,width: 2),
                      borderRadius: BorderRadius.circular(20,),

                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  style: const TextStyle(
                    color: Colors.black, // Adjust for your theme
                  ),
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_validateForm()) {
                      await _submitForm();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return false;
    }

    // Simple email validation
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }

    return true;
  }


  Future<void> sendNotification(String name, String email, String message) async {
    const serviceId = 'service_se1hnds';
    const templateId = 'template_edg8dtm';
    const publicKey = 'Y6A6HGQRs1EtKz4EA';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic ${base64Encode(utf8.encode('$publicKey:'))}'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'public_key': publicKey,
          'template_params': {
            'name': name,
            'email': email,
            'message': message,
          }
        }));

    if (response.statusCode == 200) {
      print('Notification sent');
    } else {
      print('Failed to send notification');
    }
  }


  Future<void> _submitForm() async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    sendNotification(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _messageController.text.trim(),
    );

    try {
      await _firestore.collection('contacts').add({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'message': _messageController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      });

      Get.back(); // Close the loading indicator
      Get.snackbar('Success', 'Your message has been sent!');

      // Clear form fields
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    } catch (error) {
      Get.back(); // Close the loading indicator
      Get.snackbar('Error', 'Failed to send message. Please try again later.');
    }
  }

}


