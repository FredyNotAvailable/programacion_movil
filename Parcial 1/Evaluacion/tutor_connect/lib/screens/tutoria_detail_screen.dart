import 'package:flutter/material.dart';
import '../models/tutoria.dart';

class TutoriaDetailScreen extends StatelessWidget {
  final Tutoria tutoria;

  const TutoriaDetailScreen({super.key, required this.tutoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de Tutoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Materia: ${tutoria.materia.nombre}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Docente: ${tutoria.docente.nombre}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Fecha: ${tutoria.fecha.toLocal()}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            // Agrega más campos si tienes, ejemplo:
            // Text('Horario: ${tutoria.horario}'),
            // Text('Lugar: ${tutoria.lugar}'),
            // Text('Descripción: ${tutoria.descripcion}'),
          ],
        ),
      ),
    );
  }
}
