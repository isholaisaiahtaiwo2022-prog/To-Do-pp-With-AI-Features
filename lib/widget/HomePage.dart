import 'package:flutter/material.dart';
import 'package:to_doapp/models/task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List of TO-DO Tasks
  List toDoList = [("Make Tutorial", false), ("Make Tutorial", false)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text("TO DO"), elevation: 0),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          // return todoTile(taskName: toDoList[index] [0], 
          // taskCompleted: taskCompleted, onChanged: onChanged)
        },
      ),
    );
  }
}
