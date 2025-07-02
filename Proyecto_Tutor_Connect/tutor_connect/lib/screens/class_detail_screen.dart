import 'package:flutter/material.dart';

class ClassDetailScreen extends StatelessWidget {
  final String className;

  const ClassDetailScreen({super.key, required this.className});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle: $className'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Materia: $className', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Profesor: Dr. Pérez', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const Text('Horario:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text('Lunes y Miércoles, 10:00 AM - 11:30 AM', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text('Descripción:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text(
              'Esta materia cubre los fundamentos esenciales para entender la estructura y el diseño de sistemas digitales.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
