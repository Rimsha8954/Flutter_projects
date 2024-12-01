import 'package:firebase_database/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController name = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController skills = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Employee Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            )),
      ),
      body: Center(
        child: Container(
          height: 600,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 60,
                  right: 30,
                  left: 30,
                  bottom: 20,
                ),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 30,
                  bottom: 20,
                ),
                child: TextField(
                  controller: education,
                  decoration: InputDecoration(
                    hintText: "Enter Your Education",
                    labelText: "Education",
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 30,
                  bottom: 20,
                ),
                child: TextField(
                  controller: experience,
                  decoration: InputDecoration(
                    hintText: "Enter Your Experience",
                    labelText: "Experience",
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 30,
                  bottom: 20,
                ),
                child: TextField(
                  controller: skills,
                  decoration: InputDecoration(
                    hintText: "Enter Your Skills",
                    labelText: "Skills",
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async{
                  String Id = randomAlphaNumeric(10);
                  Map<String, dynamic> employeeInfoMap = {
                    "Name": name.text,
                    "Education": education.text,
                    "Experience": experience.text,
                    "Skills": skills.text,
                    "Id": Id,
                  };
                  await DatabaseMethods.addEmployeeDetails(employeeInfoMap, Id).then((value) {
                    Fluttertoast.showToast(
                        msg: "Employee details has been added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  });
                },
                child: Text("Add", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Rounded corners
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
