import 'package:get/get.dart';

class UsersController extends GetxController {
  var users = <String>[].obs;

  void addUser(String user) {
    users.add(user);
  }

  void removeUser(String user) {
    users.remove(user);
  }
}
