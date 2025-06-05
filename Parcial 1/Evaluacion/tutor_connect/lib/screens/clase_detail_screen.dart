import 'package:flutter/material.dart';


class ClaseDetailScreen extends StatelessWidget {
  final String nombre;
  final String horario;

  const ClaseDetailScreen({super.key, required this.nombre, required this.horario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
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
            Text(nombre, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Horario:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(horario, style: const TextStyle(fontSize: 16)),
            // Aquí puedes agregar más detalles después
          ],
        ),
      ),
    );
  }
}
