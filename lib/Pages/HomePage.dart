import 'package:flutter/material.dart';
import 'package:to_doapp/Utilitis/To-Do_File.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          todoTile(),
          todoTile(),
          todoTile(),
          todoTile(),
          todoTile(),
        ],
      ),
    );
  }
}