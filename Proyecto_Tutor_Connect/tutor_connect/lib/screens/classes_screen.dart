import 'package:flutter/material.dart';
import 'class_detail_screen.dart';  // Asegúrate que esta ruta es correcta

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clases = [
      'Matemáticas Discretas',
      'Programación I',
      'Bases de Datos',
      'Arquitectura de Computadoras',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Clases')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: clases.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.book),
              title: Text(clases[index]),
              subtitle: const Text('Profesor: Dr. Pérez'),
              onTap: () {
                // Navega a la pantalla de detalle pasando el nombre de la clase
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ClassDetailScreen(className: clases[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
