import 'package:flutter/material.dart';
import 'quiz_screen.dart'; // Import the QuizScreen
import 'settings_screen.dart'; // Import the SettingsScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 15, 69),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Quiz App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 181, 26, 91),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.quiz),
              title: Text('Quiz'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
               'assets/images/quiz2.webp', // Your image asset
                width: 300,
                
              ),
              SizedBox(width: 50), // Add space between image and text
              Text(
                'WELCOME TO QUIZ APP',
                style: TextStyle(fontSize: 24,color: Colors.white),
                
              ),
            ],
          ),
   )
   );
  
  }
}
