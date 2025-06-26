import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> clases = const [
    {
      'titulo': 'Programación I',
      'descripcion': 'Introducción a la programación con énfasis en lógica y algoritmos.'
    },
    {
      'titulo': 'Bases de Datos',
      'descripcion': 'Diseño y gestión de bases de datos relacionales.'
    },
    {
      'titulo': 'Redes de Computadoras',
      'descripcion': 'Conceptos fundamentales de redes LAN y WAN.'
    },
    {
      'titulo': 'Desarrollo Web',
      'descripcion': 'Creación de sitios web con HTML, CSS y JavaScript.'
    },
    {
      'titulo': 'Inteligencia Artificial',
      'descripcion': 'Principios básicos de IA y aprendizaje automático.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clases TICs')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: clases.length,
        itemBuilder: (context, index) {
          final clase = clases[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clase['titulo']!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    clase['descripcion']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aquí podrías navegar a los detalles de la clase
                      },
                      child: const Text('Ver más'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
