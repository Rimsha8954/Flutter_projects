import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify_client/Controller/purchase_controller.dart';
import 'package:trendify_client/Pages/confirm_order.dart';

import '../Models/product/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Product Details",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    fit: BoxFit.cover,
                    width: double.maxFinite,
                    height: 300,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  product.name ?? '',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  product.description ?? '',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rs : ${product.price ?? ''}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      "Billing Address",
                    ),
                    hintText: 'Enter your Billing Address',
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  maxLines: 3,
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      ctrl.submitOrder(
                          price: product.price ?? 00,
                          item: product.name ?? '',
                          description: product.description ?? '');

                      Get.to(ctrl.orderSuccess(transactionId: ''));
                    },
                    
                    child: Text(
                      "Buy Now",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                          horizontal: 80, vertical: 10), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
