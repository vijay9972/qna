import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Ensure this line is present

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(), // Ensure HomeScreen is correctly spelled
    );
  }
}
