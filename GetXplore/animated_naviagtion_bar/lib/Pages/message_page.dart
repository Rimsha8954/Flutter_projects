import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/message_controller.dart';


class MessagePage extends StatelessWidget {
   MessagePage({super.key, });

   final MessagesController messagesController = Get.put(MessagesController());
   final TextEditingController messageController = TextEditingController();

   @override
  Widget build(BuildContext context) {

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Messages", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),),
        centerTitle: true,
      ),

       body: Column(
         children: [
           Expanded(
             child: Obx(
                   () => ListView.builder(
                 itemCount: messagesController.messages.length,
                 reverse: true, // Latest messages at the bottom
                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                 itemBuilder: (context, index) {
                   final messageData = messagesController.messages[index];
                   final isSentByUser = messageData['isUser'];

                   return Align(
                     alignment: isSentByUser
                         ? Alignment.centerRight
                         : Alignment.centerLeft,
                     child: Column(
                       crossAxisAlignment: isSentByUser
                           ? CrossAxisAlignment.end
                           : CrossAxisAlignment.start,
                       children: [
                         Container(
                           margin: const EdgeInsets.symmetric(vertical: 5),
                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                           decoration: BoxDecoration(
                             color: isSentByUser ? Colors.green : Colors.grey[300],
                             borderRadius: BorderRadius.circular(20),
                           ),
                           child: Text(
                             messageData['text'],
                             style: TextStyle(
                               color: isSentByUser ? Colors.white : Colors.black87,
                             ),
                           ),
                         ),
                         Text(
                           messageData['time'],
                           style: const TextStyle(fontSize: 12, color: Colors.grey),
                         ),
                       ],
                     ),
                   );
                 },
               ),
             ),
           ),
           _buildInputSection(),
         ],
       ),
     );
   }

   Widget _buildInputSection() {
     return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Row(
         children: [
           Expanded(
             child: TextField(
               controller: messageController,
               decoration: InputDecoration(
                 hintText: "Type your message...",
                 filled: true,
                 fillColor: Colors.grey[200],
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(30),
                   borderSide: BorderSide.none,
                 ),
                 contentPadding: const EdgeInsets.symmetric(
                   vertical: 10,
                   horizontal: 20,
                 ),
               ),
             ),
           ),
           const SizedBox(width: 10),
           CircleAvatar(
             radius: 25,
             backgroundColor: Colors.green,
             child: IconButton(
               icon: const Icon(Icons.send, color: Colors.white),
               onPressed: () {
                 final message = messageController.text.trim();
                 if (message.isNotEmpty) {
                   messagesController.sendMessage(message);
                   messageController.clear();
                   _simulateBotReply(message);
                 }
               },
             ),
           ),
         ],
       ),
     );
   }

   void _simulateBotReply(String userMessage) {
     Future.delayed(const Duration(seconds: 1), () {
       final botReply = _generateBotReply(userMessage);
       messagesController.sendBotMessage(botReply);
     });
   }

   String _generateBotReply(String userMessage) {
     // Simple bot logic
     if (userMessage.toLowerCase().contains('hello')) {
       return "Hi there! How can I help you?";
     } else if (userMessage.toLowerCase().contains('how are you')) {
       return "I'm just a bot, but I'm doing great! Thanks for asking.";
     } else if (userMessage.toLowerCase().contains('bye')) {
       return "Goodbye! Have a great day!";
     } else {
       return "I'm sorry, I didn't understand that.";
     }
   }
}
