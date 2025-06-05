import 'package:flutter/material.dart';
import '../models/materia.dart';  // Ajusta la ruta según tu proyecto

class AgregarClaseScreen extends StatefulWidget {
  final Function(String nombreClase, String horario, Materia materia) onAgregar;
  final List<Materia> materiasDisponibles;

  const AgregarClaseScreen({
    super.key,
    required this.onAgregar,
    required this.materiasDisponibles,
  });

  @override
  State<AgregarClaseScreen> createState() => _AgregarClaseScreenState();
}

class _AgregarClaseScreenState extends State<AgregarClaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();

  Materia? _materiaSeleccionada;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_materiaSeleccionada == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor selecciona una materia')),
        );
        return;
      }
      widget.onAgregar(
        _nombreController.text,
        _horarioController.text,
        _materiaSeleccionada!,
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _horarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nueva Clase'),
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
                items: widget.materiasDisponibles.map((materia) {
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
              TextFormField(
                controller: _nombreController,
                decoration:
                    const InputDecoration(labelText: 'Nombre de la clase'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre de la clase';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _horarioController,
                decoration: const InputDecoration(labelText: 'Horario'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el horario';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
