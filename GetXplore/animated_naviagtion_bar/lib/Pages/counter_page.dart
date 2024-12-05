import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/counter_controller.dart';

class CounterPage extends StatelessWidget {
   CounterPage({super.key});


  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Counter Page', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated counter value
            Obx(() {
              return AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  '${_counterController.counter.value}',
                  key: ValueKey<int>(_counterController.counter.value),
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              );
            }),

            SizedBox(height: 40),

            // Counter buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrement Button
                ElevatedButton(
                  onPressed: _counterController.decrement,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.grey,
                  ),
                  child: Icon(Icons.remove, size: 30, color: Colors.black,),
                ),

                SizedBox(width: 10),

                // Reset Button
                ElevatedButton(
                  onPressed: _counterController.reset,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    backgroundColor: Colors.black,
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),

                SizedBox(width: 10),

                // Increment Button
                ElevatedButton(
                  onPressed: _counterController.increment,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.green,
                  ),
                  child: Icon(Icons.add, size: 30, color: Colors.black,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
