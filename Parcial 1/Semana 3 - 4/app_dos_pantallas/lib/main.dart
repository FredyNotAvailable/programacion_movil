import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil Flutter',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: MyHomePage(
        title: 'Perfil de Freddy Guaman',
        isDarkMode: _themeMode == ThemeMode.dark,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const MyHomePage({
    super.key,
    required this.title,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
        actions: [
          // Botón para cambiar tema claro / oscuro
          IconButton(
            icon: Icon(
                widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: Colors.white,
            ),
            onPressed: widget.toggleTheme,
            tooltip: 'Cambiar tema',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            const Text(
              'Freddy Guaman',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Ingeniero en Sistemas',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text('Contador de clicks:', style: TextStyle(fontSize: 16)),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              },
              child: const Text("Presióname"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar contador',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _pressed = false;
  final List<String> _items = [];

  void _toggleButton() {
    setState(() {
      _pressed = !_pressed;
    });
  }

  void _addItem() {
    setState(() {
      _items.add('Elemento ${_items.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Detalles adicionales'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '¡Hola desde la segunda pantalla!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width: 250,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleButton,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _pressed ? Colors.green : Colors.red,
                ),
                child: Text(_pressed ? '¡Presionado!' : 'Presióname'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addItem,
                child: const Text('Agregar elemento a la lista'),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.check),
                    title: Text(_items[index]),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Volver a la pantalla principal'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
