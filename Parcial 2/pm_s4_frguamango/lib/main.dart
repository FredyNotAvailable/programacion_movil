import 'package:flutter/material.dart';
import 'package:pm_s4_frguamango/chat/chat_screen.dart';
import 'package:pm_s4_frguamango/config/theme/app_theme.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 1).theme(),
      home: 
      // Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.green,
      //     title: Text("Mi nuevo titulo"),
      //   ),
      //   body: Text("Body texto"),
      // ),
      const ChatScreen(),
    );
  }
}