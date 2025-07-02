import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'profile_screen.dart';
import 'settings_screen.dart';
import 'policies_screen.dart';
import 'classes_screen.dart';      // Importa la pantalla de clases
import 'tutoring_screen.dart';    // Importa la pantalla de tutorías

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final user = FirebaseAuth.instance.currentUser;

  // Lista de pantallas para BottomNavigationBar
  late final List<Widget> _pages = [
    const ClassesScreen(),
    const TutoringScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar sesión',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user?.email ?? 'Usuario'),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                child: Text(
                  (user?.email != null && user!.email!.isNotEmpty)
                      ? user!.email![0].toUpperCase()
                      : 'U',
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(userEmail: user?.email ?? ''),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Políticas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PoliciesScreen()),
                );
              },
            ),
          ],
        ),
      ),

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.class_),
            label: 'Clases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tutorías',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
