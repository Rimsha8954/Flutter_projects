import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/user_controller.dart';


class UsersPage extends StatelessWidget {
    UsersPage({super.key});

    final UsersController usersController = Get.put(UsersController());
    final TextEditingController userController = TextEditingController();

    @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Users', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),),
        centerTitle: true,
      ),

        body: Column(
          children: [
            _buildInputSection(),
            SizedBox(height: 10),
            Expanded(
              child: Obx(
                    () => usersController.users.isEmpty
                    ? Center(
                  child: Text(
                    "No users found. Add a user to get started!",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: usersController.users.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  itemBuilder: (context, index) {
                    final user = usersController.users[index];
                    return _buildUserCard(user, index);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildInputSection() {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TextField(
                controller: userController,
                decoration: InputDecoration(
                  labelText: "Enter User Name",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.green,
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  final userName = userController.text.trim();
                  if (userName.isNotEmpty) {
                    usersController.addUser(userName);
                    userController.clear();
                  }
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildUserCard(String userName, int index) {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green[100],
            child: Text(
              userName.substring(0, 1).toUpperCase(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ),
          title: Text(
            userName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "User ID: ${index + 1}",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => usersController.removeUser(userName),
          ),
        ),

    );
   }
}
