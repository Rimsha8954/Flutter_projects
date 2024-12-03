import 'package:get/get.dart';

class CartController extends GetxController{
  var cartItems = <String, int>{}.obs;


  // Add item to the cart
  void addItem(String item) {
    // Check if the item already exists in the cart
    if (cartItems.containsKey(item)) {
      // If it exists, increase the count by 1
      cartItems[item] = cartItems[item]! + 1;
    } else {
      // If it doesn't exist, add the item with a count of 1
      cartItems[item] = 1;
    }
  }

  // Remove item from the cart
  void removeItem(String item) {
    // Check if the item exists in the cart and its count is greater than 0
    if (cartItems.containsKey(item) && cartItems[item]! > 0) {

      // Decrease the quantity of the item by 1
      cartItems[item] = cartItems[item]! - 1;

      // If the quantity reaches 0, remove the item from the cart
      if (cartItems[item] == 0) {
        cartItems.remove(item); // Remove the item if count is 0
      }
    }
  }

  int get totalItems => cartItems.values.fold(0, (sum, count) => sum + count);

}