import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TutorConnectApp());
}

class TutorConnectApp extends StatelessWidget {
  const TutorConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TutorConnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
