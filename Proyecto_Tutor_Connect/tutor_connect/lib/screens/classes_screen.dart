import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'class_detail_screen.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  Key _streamKey = UniqueKey();

  void _refrescarMaterias() {
    setState(() {
      _streamKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clases'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refrescar',
            onPressed: _refrescarMaterias,
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        key: _streamKey,
        stream: FirebaseFirestore.instance.collection('materias').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('Error al cargar materias: ${snapshot.error}');
            return const Center(child: Text('Error al cargar materias'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            debugPrint('snapshot.hasData es false');
            return const Center(child: Text('No hay datos disponibles'));
          }

          if (snapshot.data!.docs.isEmpty) {
            debugPrint('No hay materias en la colección');
            return const Center(child: Text('No hay materias.'));
          }

          final materias = snapshot.data!.docs;

          debugPrint('Materias encontradas: ${materias.length}');
          for (var doc in materias) {
            debugPrint('Materia: ${doc.data()}');
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: materias.length,
            itemBuilder: (context, index) {
              final materia = materias[index].data()! as Map<String, dynamic>;
              final nombre = materia['nombre'] ?? 'Sin nombre';
              final docente = materia['docente'] ?? 'Sin docente';
              final descripcion = materia['descripcion'] ?? 'Sin descripción';

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(nombre),
                  subtitle: Text('Docente: $docente\nDescripción: $descripcion'),
                  isThreeLine: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ClassDetailScreen(className: nombre),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
