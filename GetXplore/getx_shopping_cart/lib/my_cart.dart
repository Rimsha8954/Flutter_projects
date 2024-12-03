import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shopping_cart/cart_controller.dart';
import 'package:getx_shopping_cart/total_cart_items.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});


  final List<String> items = [
    "Sneakers",
    "Joggers",
    "Sandels",
    "Heels",
    "Coat Shoes",
    "Flats",
  ];

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Text("Prestige Trolley", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w900),),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      title: Text(item, style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w900)),
                      trailing: Obx(() {
                        final count = cartController.cartItems[item] ?? 0;
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Remove button
                            IconButton(
                              icon: const Icon(Icons.remove_circle, color: Colors.black54,),
                              onPressed: () => cartController.removeItem(item),
                            ),
                            // Display count
                            Text(
                              '$count',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            // Add button
                            IconButton(
                              icon: const Icon(Icons.add_circle, color: Colors.black),
                              onPressed: () => cartController.addItem(item),
                            ),
                          ],
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 50,),
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
                onPressed: () => Get.to(TotalCartItems()),
                child: Text("Total", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),),
              ),

            ),
          ),
        ],
      ),

    );
  }
}



