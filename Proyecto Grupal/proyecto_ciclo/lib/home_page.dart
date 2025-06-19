import 'package:flutter/material.dart';
import 'custom_drawer.dart';
import 'app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateTo(BuildContext context, String route) {
    Navigator.pop(context); // cerrar drawer si está abierto
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      drawer: CustomDrawer(
        onHomeTap: () => Navigator.pop(context),
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
          Navigator.pushNamed(context, AppRoutes.actividades);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(
              context,
              icon: Icons.event,
              title: 'Actividades',
              color: Colors.blue,
              onTap: () => _navigateTo(context, AppRoutes.actividades),
            ),
            _buildCard(
              context,
              icon: Icons.class_,
              title: 'Clases',
              color: Colors.orange,
              onTap: () => _navigateTo(context, AppRoutes.clases),
            ),
            _buildCard(
              context,
              icon: Icons.settings,
              title: 'Configuración',
              color: Colors.green,
              onTap: () => _navigateTo(context, AppRoutes.settings),
            ),
            _buildCard(
              context,
              icon: Icons.info,
              title: 'Acerca de',
              color: Colors.purple,
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Proyecto Ciclo 5',
                  applicationVersion: '1.0.0',
                  applicationLegalese: '© 2025 Mi Universidad',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      required String title,
      required Color color,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: color.darken(0.3),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension ColorShade on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
