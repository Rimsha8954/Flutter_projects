import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:trendify_client/Controller/purchase_controller.dart';

import '../Models/product/product.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
          body: Column(children: [
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
          "Confirm Order",
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
          )
        ),
        ),
      ]));
    });
  }
}
