import 'package:flutter/material.dart';

void main() => runApp(MyDrawerApp());

class MyDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menú Lateral - Drawer'),
        ),
        drawer: Drawer( // El Drawer se usa para crear el menú lateral
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Menú Principal',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
                onTap: () {
                  Navigator.pop(context); // Cierra el Drawer al seleccionar
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Configuración'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Contenido principal de la app'),
        ),
      ),
    );
  }
}
