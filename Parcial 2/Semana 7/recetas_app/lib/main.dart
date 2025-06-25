import 'package:flutter/material.dart';

void main() => runApp(const RecetasApp());

class RecetasApp extends StatelessWidget {
  const RecetasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Recetas',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Roboto', fontSize: 18),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const RecipeList(),
    const FavoriteRecipes(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App de Recetas'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrange),
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 28)),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => _navigateTo(context, const ProfileScreen()),
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ayuda'),
              onTap: () => _navigateTo(context, const HelpScreen()),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
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

// --------------------- Pestaña 1: Lista de Recetas ---------------------
class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recetas Destacadas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                RecipeCard(
                  title: 'Ensalada César',
                  image: 'https://images.aws.nestle.recipes/resized/69e14ff7a1b1fea5d3976defa9d4903a_CPK_cesar_a-hero_1200_628.jpg',
                ),
                RecipeCard(
                  title: 'Lasaña',
                  image: 'https://newmansown.com/wp-content/uploads/2022/03/Homemade-lasagna.png',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


// --------------------- Componente con Stack y Row ---------------------
class RecipeCard extends StatelessWidget {
  final String title;
  final String image;

  const RecipeCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Stack( // Uso de Stack
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(image, height: 160, width: double.infinity, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row( // Uso de Row
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(Icons.favorite_border, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// --------------------- Pestaña 2: Favoritos ---------------------
class FavoriteRecipes extends StatelessWidget {
  const FavoriteRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Aquí aparecerán tus recetas favoritas',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
    );
  }
}

// --------------------- Pestaña 3: Configuración ---------------------
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Row( // Uso de Row
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Notificaciones', style: TextStyle(fontSize: 18)),
            Switch(value: true, onChanged: null),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Modo oscuro', style: TextStyle(fontSize: 18)),
            Switch(value: false, onChanged: null),
          ],
        ),
      ],
    );
  }
}

// --------------------- Pantalla: Perfil ---------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Column( // Uso de Column
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/100'),
            ),
            SizedBox(height: 16),
            Text('Nombre del Usuario', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('correo@ejemplo.com', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// --------------------- Pantalla: Ayuda ---------------------
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ayuda')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column( // Uso de Column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Preguntas Frecuentes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('- ¿Cómo agregar recetas favoritas?'),
            Text('- ¿Cómo editar mi perfil?'),
            Text('- ¿Dónde contactar soporte?'),
          ],
        ),
      ),
    );
  }
}
