import 'package:flutter/material.dart';
import 'app_routes.dart';
import 'custom_drawer.dart';

class ActividadesPage extends StatelessWidget {
  const ActividadesPage({super.key});

  final List<Map<String, String>> actividades = const [
    {
      'titulo': 'Taller de Flutter',
      'descripcion': 'Aprende a crear apps móviles con Flutter.',
      'fecha': '10 de julio',
    },
    {
      'titulo': 'Seminario de Ciberseguridad',
      'descripcion': 'Conoce las últimas técnicas de seguridad informática.',
      'fecha': '15 de julio',
    },
    {
      'titulo': 'Proyecto Final',
      'descripcion': 'Presentación y defensa del proyecto integrador.',
      'fecha': '20 de julio',
    },
    {
      'titulo': 'Hackathon TI',
      'descripcion': 'Competencia para desarrollar soluciones tecnológicas.',
      'fecha': '25 de julio',
    },
    {
      'titulo': 'Charla de Innovación',
      'descripcion': 'Tendencias y avances en tecnología de la información.',
      'fecha': '30 de julio',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades'),
      ),
      drawer: CustomDrawer(
        onHomeTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.home);
        },
        onSettingsTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.settings);
        },
        onClasesTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.clases);
        },
        onActividadesTap: () {
          Navigator.pop(context);
          // Ya estamos en actividades, solo cerrar drawer
        },
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: actividades.length,
        itemBuilder: (context, index) {
          final actividad = actividades[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.event, color: Colors.blue),
              title: Text(actividad['titulo'] ?? ''),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(actividad['descripcion'] ?? ''),
                  const SizedBox(height: 4),
                  Text('Fecha: ${actividad['fecha']}',
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
