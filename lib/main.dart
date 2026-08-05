import 'package:flutter/material.dart';
import 'package:to_doapp/Screens/to_do_Screen.dart';
// import 'screens/todo_screen.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF7D842),
      ),
      home: const TodoScreen(),
    );
  }
  }