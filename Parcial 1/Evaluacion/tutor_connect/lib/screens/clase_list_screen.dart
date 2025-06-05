import 'package:flutter/material.dart';
import 'agregar_clase_screen.dart'; // Asegúrate de tener este archivo creado
import 'clase_detail_screen.dart'; // Para ver detalles de clase


class ClaseListScreen extends StatefulWidget {
  const ClaseListScreen({super.key});

  @override
  State<ClaseListScreen> createState() => _ClaseListScreenState();
}

class _ClaseListScreenState extends State<ClaseListScreen> {
  // Lista que guarda las clases
  final List<Map<String, String>> clases = [
    {'nombre': 'Matemáticas', 'horario': 'Lunes 08:00 - 10:00'},
    {'nombre': 'Física', 'horario': 'Miércoles 14:00 - 16:00'},
  ];

  // Esta función agrega una nueva clase
  void _agregarClase(String nombre, String horario) {
    setState(() {
      clases.add({'nombre': nombre, 'horario': horario});
    });
  }

  void _abrirAgregarClase() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgregarClaseScreen(onAgregar: _agregarClase),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Clases'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _abrirAgregarClase,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: clases.length,
        itemBuilder: (context, index) {
          final clase = clases[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(clase['nombre']!),
              subtitle: Text(clase['horario']!),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClaseDetailScreen(
                        nombre: clase['nombre']!,
                        horario: clase['horario']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
