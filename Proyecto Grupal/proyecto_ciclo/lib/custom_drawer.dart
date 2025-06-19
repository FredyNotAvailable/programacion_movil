import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onHomeTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onClasesTap;
  final VoidCallback onActividadesTap;

  const CustomDrawer({
    super.key,
    required this.onHomeTap,
    required this.onSettingsTap,
    required this.onClasesTap,
    required this.onActividadesTap,
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
            text: 'Settings',
            onTap: onSettingsTap,
          ),
          _buildDrawerItem(
            icon: Icons.class_,
            text: 'Clases',
            onTap: onClasesTap,
          ),
          _buildDrawerItem(
            icon: Icons.event_note,
            text: 'Actividades',
            onTap: onActividadesTap,
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
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
