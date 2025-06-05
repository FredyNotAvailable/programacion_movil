import 'package:flutter/material.dart';
import 'agregar_clase_screen.dart';
import 'clase_detail_screen.dart';
import '../models/clase.dart';      // Ajusta la ruta
import '../models/materia.dart';   // Ajusta la ruta
import '../models/docente.dart';   // Ajusta la ruta

class ClaseListScreen extends StatefulWidget {
  const ClaseListScreen({super.key});

  @override
  State<ClaseListScreen> createState() => _ClaseListScreenState();
}

class _ClaseListScreenState extends State<ClaseListScreen> {
  // Simulamos algunas materias y docentes disponibles
  final List<Materia> materiasDisponibles = [
    Materia(nombre: 'Matemáticas', docente: Docente(nombre: 'Luis Pérez')),
    Materia(nombre: 'Física', docente: Docente(nombre: 'Ana Torres')),
  ];

  // Lista que guarda las clases con sus materias asociadas
  final List<Clase> clases = [
    Clase(
      nombre: 'Matemáticas Avanzadas',
      horario: 'Lunes 08:00 - 10:00',
      materia: Materia(nombre: 'Matemáticas', docente: Docente(nombre: 'Luis Pérez')),
    ),
    Clase(
      nombre: 'Física Experimental',
      horario: 'Miércoles 14:00 - 16:00',
      materia: Materia(nombre: 'Física', docente: Docente(nombre: 'Ana Torres')),
    ),
  ];

  void _agregarClase(String nombre, String horario, Materia materia) {
    setState(() {
      clases.add(Clase(nombre: nombre, horario: horario, materia: materia));
    });
  }

  void _eliminarClase(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: const Text('¿Estás seguro de eliminar esta clase?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Eliminar'),
            onPressed: () {
              setState(() {
                clases.removeAt(index);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _abrirAgregarClase() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgregarClaseScreen(
          materiasDisponibles: materiasDisponibles,
          onAgregar: _agregarClase,
        ),
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
              title: Text(clase.nombre),
              subtitle: Text('${clase.horario} - Materia: ${clase.materia.nombre}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClaseDetailScreen(clase: clase),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _eliminarClase(index),
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
