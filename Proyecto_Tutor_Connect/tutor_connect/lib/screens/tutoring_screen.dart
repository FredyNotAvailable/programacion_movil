import 'package:flutter/material.dart';
import 'tutoring_detail_screen.dart';  // Importa el detalle de tutoría

class TutoringScreen extends StatelessWidget {
  const TutoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutorias = [
      'Tutoría de Matemáticas',
      'Tutoría de Programación',
      'Tutoría de Física',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tutorías')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tutorias.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(tutorias[index]),
              subtitle: const Text('Disponible: Lunes y Miércoles'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        TutoringDetailScreen(tutoringName: tutorias[index]),
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
