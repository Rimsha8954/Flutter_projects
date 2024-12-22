import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Custom Widgets/custom_textfield.dart';

class AddTask extends StatefulWidget {
  final Map? todo;
  const AddTask({super.key, this.todo});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit  = false;


  @override
  void initState() {
    final todo = widget.todo;
    super.initState();
    if(widget.todo != null){
      isEdit = true;
      final title = todo?['title'];
      final description = todo?['description'];
      taskController.text = title;
      descriptionController.text = description;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(isEdit? 'Edit Task' : 'Add Task', style: TextStyle(fontWeight: FontWeight.w900),)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Enter the Task',
                labelText: 'Task',
                prefixIcon: Icons.task,
                minlines: 1,
                maxlines: 2,
                controller: taskController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Write Description...',
                labelText: 'Description',
                prefixIcon: Icons.description,
                controller: descriptionController,
                minlines: 2,
                maxlines: 5,
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  onPressed: (){
                isEdit? updateTask() : submitTask();
              },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // Text color
                  shadowColor: Colors.blueAccent, // Shadow color
                  elevation: 7, // Elevation
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ), // Padding
                ),
                child: Text(isEdit? 'Update': 'Submit', style: TextStyle(fontWeight: FontWeight.w900,),),),



            ],
          ),
        ),
      ),
    );
  }




  Future<void> updateTask() async{

    final todo = widget.todo;
    if(todo == null){
      print('You cant call updated widget without todo data');
      return ;
    }

    final id = todo['_id'];
    //final isCompleted = todo['is_completed'];
    //Get the data from form
    final title = taskController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    // Submit update data to the server
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(uri, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});


    //show success or fail message based on status
    if(response.statusCode == 200){
      // taskController.text = '';
      // descriptionController.text = '';
      showSuccessMessage('Updation Success');
    }else{
      showErrorMessage('Updation Failed');
    }


  }

  Future<void> submitTask() async{
    //Get the data from form
    final title = taskController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };


    // Submit data to the server
    const url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});


    //show success or fail message based on status
    if(response.statusCode == 201){
      taskController.text = '';
      descriptionController.text = '';
       showSuccessMessage('Creation Success');
    }else{
      showErrorMessage('Creation Failed');
    }
  }

  void showSuccessMessage(String message){
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
        content: Text(message, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message){
    final snackBar = SnackBar(
      backgroundColor: Colors.redAccent,
        content: Text(message, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}

