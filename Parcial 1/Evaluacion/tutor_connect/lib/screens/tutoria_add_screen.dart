import 'package:flutter/material.dart';
import '../models/tutoria.dart';
import '../models/materia.dart';
import '../models/docente.dart';

class TutoriaAddScreen extends StatefulWidget {
  final Function(Tutoria) onAgregar;

  const TutoriaAddScreen({super.key, required this.onAgregar});

  @override
  State<TutoriaAddScreen> createState() => _TutoriaAddScreenState();
}

class _TutoriaAddScreenState extends State<TutoriaAddScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _fechaSeleccionada;
  Materia? _materiaSeleccionada;

  // Lista de materias simulada
  final List<Materia> _materiasDisponibles = [
    Materia(nombre: 'Matemáticas', docente: Docente(nombre: 'Luis Pérez')),
    Materia(nombre: 'Historia', docente: Docente(nombre: 'Ana Torres')),
    Materia(nombre: 'Biología', docente: Docente(nombre: 'Carlos Ríos')),
    Materia(nombre: 'Ingeniero ambiental', docente: Docente(nombre: 'Franco Quezada')),
  ];

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    if (fecha != null) {
      setState(() {
        _fechaSeleccionada = fecha;
      });
    }
  }

  void _guardarTutoria() {
    if (_formKey.currentState!.validate()) {
      if (_fechaSeleccionada == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor selecciona una fecha')),
        );
        return;
      }

      final nuevaTutoria = Tutoria(
        materia: _materiaSeleccionada!,
        docente: _materiaSeleccionada!.docente,
        fecha: _fechaSeleccionada!,
      );

      widget.onAgregar(nuevaTutoria);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Tutoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<Materia>(
                decoration: const InputDecoration(
                  labelText: 'Materia',
                  border: OutlineInputBorder(),
                ),
                items: _materiasDisponibles.map((materia) {
                  return DropdownMenuItem<Materia>(
                    value: materia,
                    child: Text(materia.nombre),
                  );
                }).toList(),
                onChanged: (Materia? value) {
                  setState(() {
                    _materiaSeleccionada = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Por favor selecciona una materia' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _fechaSeleccionada == null
                          ? 'No se ha seleccionado fecha'
                          : 'Fecha seleccionada: ${_fechaSeleccionada!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                  TextButton(
                    onPressed: () => _seleccionarFecha(context),
                    child: const Text('Seleccionar fecha'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _guardarTutoria,
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
