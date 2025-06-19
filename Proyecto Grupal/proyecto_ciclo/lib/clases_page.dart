import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'app_routes.dart';

class ClasesPage extends StatelessWidget {
  const ClasesPage({super.key});

  final List<Map<String, String>> clases = const [
    {
      'nombre': 'Arquitectura de Computadoras',
      'descripcion': 'Estudio de la organización interna y funcionamiento de computadoras.',
      'profesor': 'Ing. López',
      'horario': 'Lunes 8:00 - 10:00',
    },
    {
      'nombre': 'Programación Avanzada',
      'descripcion': 'Profundización en paradigmas y técnicas de programación.',
      'profesor': 'Ing. Martínez',
      'horario': 'Martes 10:00 - 12:00',
    },
    {
      'nombre': 'Bases de Datos',
      'descripcion': 'Diseño, implementación y gestión de bases de datos.',
      'profesor': 'Ing. Pérez',
      'horario': 'Miércoles 14:00 - 16:00',
    },
    {
      'nombre': 'Redes de Computadoras',
      'descripcion': 'Fundamentos y protocolos de redes.',
      'profesor': 'Ing. Gómez',
      'horario': 'Jueves 16:00 - 18:00',
    },
    {
      'nombre': 'Seguridad Informática',
      'descripcion': 'Conceptos básicos y técnicas de seguridad en sistemas.',
      'profesor': 'Ing. Sánchez',
      'horario': 'Viernes 8:00 - 10:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clases - Carrera TI Ciclo 5')),
      drawer: CustomDrawer(
        onHomeTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.home);
        },
        onSettingsTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.settings);
        },
        onClasesTap: () {
          Navigator.pop(context);
          // Ya estamos en Clases, solo cerramos el drawer
        },
        onActividadesTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.actividades);
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: clases.length,
        itemBuilder: (context, index) {
          final clase = clases[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.blue),
              title: Text(clase['nombre'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(clase['descripcion'] ?? ''),
                  const SizedBox(height: 4),
                  Text('Profesor: ${clase['profesor']}', style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text('Horario: ${clase['horario']}'),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
