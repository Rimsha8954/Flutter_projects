import 'package:flutter/material.dart';

import '../Reuseable Widgets/reuseable_row.dart';

class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases, totalDeaths, active, critical, recovered, test;
   DetailsScreen({
     required this.name,
     required this.image,
     required this.totalCases,
     required this.totalDeaths,
     required this.critical,
     required this.recovered,
     required this.test,
     required this.active,
   });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0, vertical: MediaQuery.of(context).size.height * 0.07),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      ReuseableRow(value: widget.totalCases.toString(), title: "Total Cases"),
                      ReuseableRow(value: widget.active.toString(), title: "Active Cases"),
                      ReuseableRow(value: widget.recovered.toString(), title: "Recovered"),
                      ReuseableRow(value: widget.test.toString(), title: "Tests"),
                      ReuseableRow(value: widget.critical.toString(), title: "Critical Cases"),
                      ReuseableRow(value: widget.totalDeaths.toString(), title: "Total Deaths"),
                    ],
                  ),
                ),
                
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}
