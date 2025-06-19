import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'app_routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  final List<Map<String, String>> settingsOptions = const [
    {
      'titulo': 'Cuenta',
      'descripcion': 'Gestiona tu información personal y contraseña.',
    },
    {
      'titulo': 'Notificaciones',
      'descripcion': 'Configura las notificaciones que deseas recibir.',
    },
    {
      'titulo': 'Privacidad',
      'descripcion': 'Controla quién puede ver tu información.',
    },
    {
      'titulo': 'Tema',
      'descripcion': 'Cambia entre modo claro y oscuro.',
    },
    {
      'titulo': 'Acerca de',
      'descripcion': 'Información de la aplicación y versión.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      drawer: CustomDrawer(
        onHomeTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.home);
        },
        onSettingsTap: () {
          Navigator.pop(context);
          // Ya estamos en Settings
        },
        onClasesTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.clases);
        },
        onActividadesTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.actividades);
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: settingsOptions.length,
        itemBuilder: (context, index) {
          final option = settingsOptions[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: Text(option['titulo'] ?? ''),
              subtitle: Text(option['descripcion'] ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Aquí podrías agregar funcionalidad para cada opción
              },
            ),
          );
        },
      ),
    );
  }
}
