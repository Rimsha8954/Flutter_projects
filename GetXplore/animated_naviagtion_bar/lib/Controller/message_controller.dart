import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessagesController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;

  void sendMessage(String message) {
    final time = DateFormat('hh:mm a').format(DateTime.now());
    messages.insert(0, {'text': message, 'isUser': true, 'time': time});
  }

  void sendBotMessage(String message) {
    final time = DateFormat('hh:mm a').format(DateTime.now());
    messages.insert(0, {'text': message, 'isUser': false, 'time': time});
  }
}
