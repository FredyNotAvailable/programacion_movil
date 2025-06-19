import 'package:flutter/material.dart';
import 'package:pm_s6_rutas_4/app_routes.dart';
import 'package:pm_s6_rutas_4/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      drawer: CustomDrawer(
        onHomeTap: () => Navigator.pop(context), 
        onSettingsTap: () =>  Navigator.pushNamed(context, AppRoutes.settings), 
        onContactTap: () =>  Navigator.pushNamed(context, AppRoutes.contact), 
        ),
      body: Center(
        child: Text('Pantalla principal'),
      ),
    );
  }
}