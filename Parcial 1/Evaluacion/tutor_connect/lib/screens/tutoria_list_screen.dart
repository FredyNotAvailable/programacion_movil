import 'package:flutter/material.dart';
import '../models/tutoria.dart';
import 'tutoria_add_screen.dart';

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
                  title: Text(tutoria.materia),
                  subtitle: Text('Docente: ${tutoria.docente}\nFecha: ${tutoria.fecha.toLocal()}'.split(' ')[0]),
                );
              },
            ),
    );
  }
}
  