import 'package:flutter/material.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Políticas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Políticas de Privacidad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Esta aplicación recopila y utiliza datos personales únicamente para '
                'mejorar la experiencia educativa de los estudiantes de la universidad. '
                'Los datos recopilados incluyen información básica como correo electrónico '
                'y progreso académico dentro de la aplicación. '
                'No compartimos esta información con terceros sin consentimiento explícito.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Términos y Condiciones',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Al usar esta aplicación, aceptas que toda la información proporcionada sea '
                'verídica y que su uso será exclusivamente para fines educativos y académicos. '
                'El mal uso de la aplicación o la manipulación de datos podrá ser sancionado '
                'de acuerdo a las normas de la universidad.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                'Contacto',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                'Para cualquier duda o solicitud relacionada con la privacidad o términos, '
                'puedes contactarnos a través del correo: soporte@universidad.edu',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
