import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;
  String _language = 'Español';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Notificaciones'),
              subtitle: const Text('Activar o desactivar notificaciones'),
              value: _notificationsEnabled,
              onChanged: (val) {
                setState(() {
                  _notificationsEnabled = val;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Modo oscuro'),
              subtitle: const Text('Cambiar tema a modo oscuro'),
              value: _darkMode,
              onChanged: (val) {
                setState(() {
                  _darkMode = val;
                  // Aquí podrías añadir lógica para cambiar tema globalmente
                });
              },
            ),
            ListTile(
              title: const Text('Idioma'),
              subtitle: Text(_language),
              trailing: const Icon(Icons.arrow_drop_down),
              onTap: () async {
                final selected = await showDialog<String>(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: const Text('Selecciona idioma'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 'Español'),
                        child: const Text('Español'),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 'Inglés'),
                        child: const Text('Inglés'),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 'Francés'),
                        child: const Text('Francés'),
                      ),
                    ],
                  ),
                );
                if (selected != null && selected != _language) {
                  setState(() {
                    _language = selected;
                  });
                  // Aquí puedes agregar lógica para cambiar el idioma global de la app
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
