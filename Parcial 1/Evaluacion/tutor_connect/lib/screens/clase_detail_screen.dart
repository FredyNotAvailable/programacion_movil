import 'package:flutter/material.dart';
import '../models/clase.dart';  // Ajusta la ruta según tu estructura

class ClaseDetailScreen extends StatelessWidget {
  final Clase clase;

  const ClaseDetailScreen({super.key, required this.clase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clase.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre de la clase:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(clase.nombre, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Horario:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(clase.horario, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Materia:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(clase.materia.nombre, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Docente:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(clase.materia.docente.nombre, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
