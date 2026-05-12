import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(BackingTrainerApp());
}

class BackingTrainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backing Trainer Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF1F2A37),
        scaffoldBackgroundColor: Color(0xFFF4F6F8),
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF121212),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF2F2F2F),
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
