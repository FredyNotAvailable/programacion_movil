import 'package:flutter/material.dart';

void main() {
  runApp(const TutorConnectApp());
}

class TutorConnectApp extends StatelessWidget {
  const TutorConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TutorConnect',
      debugShowCheckedModeBanner: false,
      home: const PlaceholderScreen(),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TutorConnect - Inicio'),
      ),
      body: const Center(
        child: Text('Pantalla de inicio funcional'),
      ),
    );
  }
}
