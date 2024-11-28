import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import 'package:trendify_client/Pages/home_page.dart';
import '../Models/user/user.dart';

class SigninController extends GetxController {
  TextEditingController UserName = TextEditingController();
  TextEditingController UserNumber = TextEditingController();
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  TextEditingController loginNumber = TextEditingController();
  bool otpFieldShow = false;
  int? otpSend;
  int? otpEnter;


  User? loginUser;


  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if(user != null){
      loginUser = User.fromJson(user);
      Get.to(const HomePage());
    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection("Users");
    super.onInit();
  }


  addUser()  {
    try {
      if(otpSend == otpEnter){
        DocumentReference doc = userCollection.doc();
        User user = User(
          id: doc.id,
          name: UserName.text,
          number: int.tryParse(UserNumber.text),
        );
        final userJson = user.toJson();
        doc.set(userJson);

        Get.snackbar("Success", "User Added Successfully",
            colorText: Colors.green);
        UserNumber.clear();
        UserName.clear();
        otpController.clear();
      }else{

        Get.snackbar("Error", "OTP is incorrect",
            colorText: Colors.red);
      }

    } catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.green);
      print(e);
    }
  }

  sendOtp() {
    try {
      if (UserName.text.isEmpty || UserNumber.text.isEmpty) {
        Get.snackbar("Error", "Please fill the data", colorText: Colors.red);
        return; //to stop the code
      }
      final random = Random();
      int OTP = 1000 + random.nextInt(9000);
      print(OTP);

      //will send OPT and check its send succesfully or not
      if (OTP != null) {
        otpFieldShow = true;
        otpSend = OTP;
        Get.snackbar('Success', 'OTP send successfully',
            colorText: Colors.green);
      } else {
        Get.snackbar('Error', 'OTP not send', colorText: Colors.red);
      }
    } catch (e) {
      print(e);
    }finally{
      update();
    }
  }

  Future<void> loginWithNumber() async{
    try{
      String PhoneNumber = loginNumber.text;
      if(PhoneNumber.isNotEmpty){
        var querySnapshot = await userCollection.where('number', isEqualTo: int.tryParse(PhoneNumber)).limit(1).get();
        if(querySnapshot.docs.isNotEmpty){
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write("loginUser",userData);
          loginNumber.clear();
          Get.to(HomePage());
          Get.snackbar("Success", 'Login successfull',colorText: Colors.green);
        }else{
          Get.snackbar("Error", "User not found, please register", colorText: Colors.red);
        }
      }
    }catch(error){
      print("Failed to Login: $error");
      Get.snackbar("Error", "Failed to Login", colorText: Colors.red);
    }
  }
}
