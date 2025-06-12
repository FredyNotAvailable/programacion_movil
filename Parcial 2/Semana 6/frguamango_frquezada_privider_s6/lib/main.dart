// Importa el paquete principal de Flutter para crear interfaces gráficas
import 'package:flutter/material.dart';

// Importa el paquete Provider, que se usa para manejo de estado
import 'package:provider/provider.dart';

// Importa la clase Counter definida en otro archivo (counter.dart)
import 'counter.dart';

// Punto de entrada principal de la aplicación
void main() {
  runApp(
    // ChangeNotifierProvider permite que cualquier widget escuche los cambios en Counter
    ChangeNotifierProvider(
      // Crea una instancia de Counter que será compartida por toda la app
      create: (context) => Counter(),
      // MyApp es el widget raíz de la aplicación
      child: MyApp(),
    ),
  );
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación (solo para referencia)
      title: 'Contador con Provider',
      // Establece CounterScreen como la pantalla principal
      home: CounterScreen(),
    );
  }
}

// Widget que representa la pantalla del contador
class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtiene la instancia de Counter desde el Provider para usar sus métodos y datos
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      // Barra superior de la aplicación con título
      appBar: AppBar(
        title: Text('Contador con Provider'),
      ),
      // Cuerpo de la pantalla centrado
      body: Center(
        child: Column(
          // Centra los elementos verticalmente en la pantalla
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Texto estático que describe el valor
            Text('Valor actual:', style: TextStyle(fontSize: 20)),
            // Texto dinámico que muestra el valor del contador
            Text(
              '${counter.count}', // Muestra el valor actual del contador
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold), // Estilo grande y negrita
            ),
            // Fila de botones (restar, reiniciar, sumar)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centra horizontalmente los botones
              children: [
                // Botón para decrementar el contador
                IconButton(
                  icon: Icon(Icons.remove, size: 30),
                  onPressed: counter.decrement, // Llama al método decrement
                ),
                SizedBox(width: 20), // Espacio entre botones
                // Botón para reiniciar el contador
                IconButton(
                  icon: Icon(Icons.refresh, size: 30),
                  onPressed: counter.reset, // Llama al método reset
                ),
                SizedBox(width: 20), // Espacio entre botones
                // Botón para incrementar el contador
                IconButton(
                  icon: Icon(Icons.add, size: 30),
                  onPressed: counter.increment, // Llama al método increment
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
