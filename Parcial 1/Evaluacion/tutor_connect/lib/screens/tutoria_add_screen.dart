import 'package:flutter/material.dart';
import '../models/tutoria.dart';

class TutoriaAddScreen extends StatefulWidget {
  final Function(Tutoria) onAgregar;

  const TutoriaAddScreen({super.key, required this.onAgregar});

  @override
  State<TutoriaAddScreen> createState() => _TutoriaAddScreenState();
}

class _TutoriaAddScreenState extends State<TutoriaAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _materiaController = TextEditingController();
  final _docenteController = TextEditingController();
  DateTime? _fechaSeleccionada;

  void _seleccionarFecha() async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (fecha != null) {
      setState(() {
        _fechaSeleccionada = fecha;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate() && _fechaSeleccionada != null) {
      final tutoria = Tutoria(
        materia: _materiaController.text,
        docente: _docenteController.text,
        fecha: _fechaSeleccionada!,
      );
      widget.onAgregar(tutoria);
      Navigator.pop(context);
    } else if (_fechaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona una fecha')),
      );
    }
  }

  @override
  void dispose() {
    _materiaController.dispose();
    _docenteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Tutoría')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _materiaController,
                decoration: const InputDecoration(labelText: 'Materia'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese la materia';
                  return null;
                },
              ),
              TextFormField(
                controller: _docenteController,
                decoration: const InputDecoration(labelText: 'Docente'),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Ingrese el docente';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    _fechaSeleccionada == null
                        ? 'No hay fecha seleccionada'
                        : 'Fecha: ${_fechaSeleccionada!.toLocal()}'.split(' ')[0],
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _seleccionarFecha,
                    child: const Text('Seleccionar fecha'),
                  )
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Agregar Tutoría'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
