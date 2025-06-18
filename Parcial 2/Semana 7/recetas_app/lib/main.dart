import 'package:flutter/material.dart';

void main() => runApp(RecetasApp());

class RecetasApp extends StatelessWidget {
  const RecetasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Recetas',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Índice para controlar la pestaña activa del BottomNavigationBar
  int _selectedIndex = 0;

  // Lista de widgets que se mostrarán en cada pestaña
  final List<Widget> _pages = [
    Center(child: Text('Lista de Recetas', style: TextStyle(fontSize: 24))),
    Center(child: Text('Recetas Favoritas', style: TextStyle(fontSize: 24))),
    Center(child: Text('Configuración', style: TextStyle(fontSize: 24))),
  ];

  // Función para actualizar la pestaña seleccionada
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Función para cerrar el Drawer y navegar a una pantalla secundaria
  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Cierra el Drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de Recetas'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () => _navigateTo(context, ProfileScreen()),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ayuda'),
              onTap: () => _navigateTo(context, HelpScreen()),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex], // Mostrar la pestaña activa
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configuración'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Pantalla Perfil (secundaria)
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Text('Aquí va la información del perfil', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

// Pantalla Ayuda (secundaria)
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
      ),
      body: Center(
        child: Text('Aquí van las preguntas frecuentes', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
