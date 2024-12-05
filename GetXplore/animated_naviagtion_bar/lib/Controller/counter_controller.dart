import 'package:get/get.dart';

class CounterController extends GetxController {
  // Counter value
  RxInt counter = 0.obs;

  // Increment counter
  void increment() => counter.value++;

  // Decrement counter
  void decrement() {
    if (counter.value > 0) counter.value--;
  }

  // Reset counter
  void reset() => counter.value = 0;
}
