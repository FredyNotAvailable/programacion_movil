import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userEmail;
  const ProfileScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    final nombre = userEmail.split('@')[0];

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  (userEmail.isNotEmpty) ? userEmail[0].toUpperCase() : 'U',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Correo del usuario: $userEmail', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Nombre: $nombre', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Carrera: Ingeniería de Sistemas', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Semestre: 5to ciclo', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Universidad: Universidad Internacional del Ecuador', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text(
              'Descripción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              'Estudiante comprometido con sus estudios y apasionado por el desarrollo de software.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
