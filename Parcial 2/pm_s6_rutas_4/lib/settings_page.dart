import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuracion'),
      ),
      body: Center(
        child: Text('Pantalla de configuracion'),
      ),
    );
  }
}