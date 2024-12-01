import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/Services/database.dart';
import 'package:flutter/material.dart';
import 'add_employee.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController name = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController skills = TextEditingController();

  Stream? EmployeeStream;

  getontheload() async {
    EmployeeStream = await DatabaseMethods().getEmployeeDetails();
    setState(() {});
  }

  void initState() {
    getontheload();
    super.initState();
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
        stream: EmployeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //height: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Name: " + ds["Name"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      name.text = ds["Name"];
                                      education.text = ds["Education"];
                                      experience.text = ds["Experience"];
                                      skills.text = ds["Skills"];
                                      EditEmployeeDetail(ds["Id"]);
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        await DatabaseMethods()
                                            .deleteEmployeeDetail(ds["Id"]);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      )),
                                ],
                              ),
                              Text(
                                "Education: " + ds["Education"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Experience: " + ds["Experience"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Skills: " + ds["Skills"],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          },
        ),
        appBar: AppBar(
          title: Center(
              child: Text(
            "Dashboard",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          )),
        ),
        body: Column(
          children: [
            Expanded(child: allEmployeeDetails()),
          ],
        ));
  }

  Future EditEmployeeDetail(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
                child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Center(
                      child: Text(
                        "Edit Details",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
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
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> updateInfo = {
                      "Name": name.text,
                      "Education": education.text,
                      "Id": id,
                      "Experience": experience.text,
                      "Skills": skills.text,
                    };
                    await DatabaseMethods()
                        .updateEmployeeDetail(id, updateInfo)
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade100,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                    ), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                  ),
                )
              ],
            )),
          ));
}
