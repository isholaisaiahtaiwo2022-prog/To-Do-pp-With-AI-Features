import 'package:flutter/material.dart';
import 'package:to_doapp/widget/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
 
        primaryColor: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}
