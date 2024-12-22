import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task_manager/Screens/add_task.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List items = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Task Manager Dashboard", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),)),
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchTask,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(child: Text('No task todo', style: Theme.of(context).textTheme.headlineSmall,)),
            child: ListView.builder(
              itemCount: items.length,
                itemBuilder: (context, index){
                final item = items[index] as Map;
                final id = item['_id'] as String;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[800],
                        child: Text('${index + 1}')),
                    title: Text(item['title']),
                    subtitle: Text(item['description']),
            
                    trailing: PopupMenuButton(
                      onSelected: (value){
                        if(value == 'edit'){
                          navigateToEditPage(item);
                        }else if(value == 'delete'){
                          deleteById(id);
                        }
                      },
                        itemBuilder: (context){
                      return [
                        PopupMenuItem(
                          value: 'edit',
                            child: Text('Edit')),
                        PopupMenuItem(
                          value: 'delete',
                            child: Text('Delete')),
            
                      ];
                    }),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            navigateToAddPage();
          },
        backgroundColor: Colors.blue,
        label: Text("Add Task", style: TextStyle(fontWeight: FontWeight.w900),),
      ),
    );
  }


  Future<void> fetchTask() async{
    const url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });

  }

  Future<void> deleteById(String id) async{
    //Delete the item
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if(response.statusCode == 200){
      //Remove item from the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    }else{
      print(response.statusCode);
    }
  }

  Future<void> navigateToAddPage() async{
    final route = MaterialPageRoute(builder: (context) => AddTask());

    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTask();
  }

  Future<void> navigateToEditPage(Map item) async{
    final route = MaterialPageRoute(builder: (context) => AddTask(todo: item));
    await Navigator.push(context, route);

    setState(() {
      isLoading = true;
    });
    fetchTask();

  }
}
