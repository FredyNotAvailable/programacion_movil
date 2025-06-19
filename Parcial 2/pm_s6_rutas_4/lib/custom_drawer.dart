import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onContactTap;

  const CustomDrawer({
    super.key,
    required this.onHomeTap,
    required this.onSettingsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home,
            text: 'Inicio',
            onTap: onHomeTap,
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: 'Configuración',
            onTap: onSettingsTap,
          ),
          _buildDrawerItem(
            icon: Icons.contact_page,
            text: 'Contacto',
            onTap: onContactTap,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        onTap: onTap,
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
