import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //Map<String, dynamic> help us to upload user form easily to the cloud firestore
  // In string we pas name, age , location
  // In dynamic method you can pas anything string, integer, and boolean character
  static Future addEmployeeDetails(Map<String, dynamic> employeeInfoMap,
      String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }


//Always use a stream builder when you want to show data on screen from database
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }


  Future updateEmployeeDetail(String id, Map<String, dynamic> updateInfo) async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id).update(updateInfo);
  }

  Future deleteEmployeeDetail(String id) async{
    return await FirebaseFirestore.instance.collection("Employee").doc(id);
  }
}
