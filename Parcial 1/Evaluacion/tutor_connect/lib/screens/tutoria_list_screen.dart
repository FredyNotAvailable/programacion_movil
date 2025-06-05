import 'package:flutter/material.dart';
import '../models/tutoria.dart';
import 'tutoria_add_screen.dart';
import 'tutoria_detail_screen.dart'; // Importa la pantalla detalle

class TutoriaListScreen extends StatefulWidget {
  const TutoriaListScreen({super.key});

  @override
  State<TutoriaListScreen> createState() => _TutoriaListScreenState();
}

class _TutoriaListScreenState extends State<TutoriaListScreen> {
  final List<Tutoria> tutorias = [];

  void _agregarTutoria(Tutoria tutoria) {
    setState(() {
      tutorias.add(tutoria);
    });
  }

  void _eliminarTutoria(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: const Text('¿Estás seguro de eliminar esta tutoría?'),
        actions: [
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Eliminar'),
            onPressed: () {
              setState(() {
                tutorias.removeAt(index);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _abrirAgregarTutoria() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutoriaAddScreen(onAgregar: _agregarTutoria),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorías'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _abrirAgregarTutoria,
          )
        ],
      ),
      body: tutorias.isEmpty
          ? const Center(child: Text('No hay tutorías programadas.'))
          : ListView.builder(
              itemCount: tutorias.length,
              itemBuilder: (context, index) {
                final tutoria = tutorias[index];
                return ListTile(
                  title: Text(tutoria.materia.nombre),
                  subtitle: Text(
                    'Docente: ${tutoria.docente.nombre}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.info, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TutoriaDetailScreen(tutoria: tutoria),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _eliminarTutoria(index),
                      ),
                    ],
                  ),
                );

              },
            ),
    );
  }
}
