import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_shopping_cart/my_cart.dart';

import 'cart_controller.dart';

class TotalCartItems extends StatelessWidget {
    TotalCartItems({super.key});

   final CartController cartController = Get.put(CartController());


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Total Items: ", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),),
                Obx(() {
                  return Text(
                    '${cartController.totalItems.toString()}',
                    // Display total items in cart
                    style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
                  );
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black54,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                onPressed: () => Get.back(),
                child: Text("Go Back", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
              ),

            ),
          ),        ],
      ),
    );
  }
}
