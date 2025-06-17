import 'package:flutter/material.dart';

void main() => runApp(MyBottomNavApp());

class MyBottomNavApp extends StatefulWidget {
  @override
  _MyBottomNavAppState createState() => _MyBottomNavAppState();
}

class _MyBottomNavAppState extends State<MyBottomNavApp> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(child: Text('Inicio')),
    Center(child: Text('Buscar')),
    Center(child: Text('Perfil')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cambia la pestaña seleccionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Bar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barra de navegación inferior'),
        ),
        body: _pages[_selectedIndex], // Muestra la página activa
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
          currentIndex: _selectedIndex, // Índice activo
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped, // Evento al tocar una pestaña
        ),
      ),
    );
  }
}
