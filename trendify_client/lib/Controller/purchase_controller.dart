import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_client/Controller/signin_signup_contoller.dart';

import '../Models/user/user.dart';

class PurchaseController extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;
  TextEditingController address = TextEditingController();

  double orderPrice = 0;
  String itemName = '';
  String orderAddress = '';

void onInit(){
  orderCollection = firestore.collection('Orders');
  super.onInit();
}
  

  submitOrder(
      {required double price,
      required String item,
      required String description}) {


    orderPrice = price;
    itemName = item;
    orderAddress = address.text;

  }


  Future<void> orderSuccess ({required String? transactionId}) async{
  User? loginUse = Get.find<SigninController>().loginUser;
  try{
    if(transactionId != null){
      DocumentReference docRef = await orderCollection.add({
        'customer': loginUse?.name ?? '',
        'phone': loginUse?.number ?? '',
        'item': itemName,
        'price': orderPrice,
        'address': orderAddress,
        'transactionId': transactionId,
        'dateTime': DateTime.now().toString(),
      });
      print("Order created Successfully: ${docRef.id}");
      Get.snackbar("Success", "Order created Successfully",colorText: Colors.green);
    }else{
      Get.snackbar("Error", "please fill all the fields", colorText: Colors.red);
    }
  }catch(e){
    print("Failed to Register User: $e");
  }
  }
}
