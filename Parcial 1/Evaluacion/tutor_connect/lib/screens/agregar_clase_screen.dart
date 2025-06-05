import 'package:flutter/material.dart';

class AgregarClaseScreen extends StatefulWidget {
  final Function(String, String) onAgregar;

  const AgregarClaseScreen({super.key, required this.onAgregar});

  @override
  State<AgregarClaseScreen> createState() => _AgregarClaseScreenState();
}

class _AgregarClaseScreenState extends State<AgregarClaseScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _horarioController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onAgregar(_nombreController.text, _horarioController.text);
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
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre de la clase'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre de la clase';
                  }
                  return null;
                },
              ),
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
