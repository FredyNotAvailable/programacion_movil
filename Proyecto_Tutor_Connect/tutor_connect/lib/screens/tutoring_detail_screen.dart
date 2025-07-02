import 'package:flutter/material.dart';

class TutoringDetailScreen extends StatelessWidget {
  final String tutoringName;

  const TutoringDetailScreen({super.key, required this.tutoringName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle: $tutoringName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tutoría: $tutoringName', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Tutor:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('Prof. María López', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text('Horario:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('Lunes y Miércoles, 3:00 PM - 4:30 PM', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text('Descripción:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text(
              'Sesiones de tutoría personalizadas para reforzar temas difíciles y preparación para exámenes.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
