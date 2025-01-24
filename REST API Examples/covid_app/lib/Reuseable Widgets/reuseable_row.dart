import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {
  String title,value;
  ReuseableRow({super.key, required this.value, required this.title});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 12, top: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(color: Colors.white),),
              Text(value, style: TextStyle(color: Colors.white),),
            ],
          )
        ],
      ),
    );
  }
}
