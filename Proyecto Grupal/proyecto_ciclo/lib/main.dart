import 'package:flutter/material.dart';
import 'package:proyecto_ciclo/app_routes.dart';

void main() => runApp(const MyApp());

// Widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegacion',
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

