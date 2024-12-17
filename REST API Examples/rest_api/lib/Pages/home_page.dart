import 'package:flutter/material.dart';
import 'package:rest_api/services/fetch_user_api.dart';
import '../model/user.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<User> users = [];
  String errorMessage = '';
  bool isLoading = false;


  // Function to fetch users
  void fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
      isLoading = false; // Show loading indicator
      //errorMessage = ''; // Clear previous error
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers(); // Fetch users when the widget is first built
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: Center(child: Text("Rest API with Flutter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, ),)),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(), // Show loading indicator
      )
          : errorMessage.isNotEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: fetchUsers, // Retry button
              child: Text('Retry'),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          //final color = user.gender == 'male' ? Colors.grey : Colors.green;
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture.thumbnail),
            ),
            title: Text(user.fullName, style: TextStyle(fontWeight: FontWeight.w900),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.email),
                Row(
                  children: [
                    Text(user.phone),
                    SizedBox(width: 50,),
                    Text('Age: ${user.dob.age.toString()}', style: TextStyle(fontWeight: FontWeight.w800),),
                  ],
                ),

              ],
            ),
            trailing: Text(user.location.country),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add, size: 40,color: Colors.white,),
      //   backgroundColor: Colors.blueAccent[700],
      //     onPressed: fetchUsers,
      // ),
    );
  }


}
