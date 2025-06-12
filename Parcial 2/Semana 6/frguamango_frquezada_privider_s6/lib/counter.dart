import 'package:flutter/material.dart'; // Importa las herramientas básicas de Flutter

// Define la clase Counter, que extiende ChangeNotifier para usar con Provider
class Counter with ChangeNotifier {
  int _count = 0; // Variable privada para almacenar el contador

  // Getter para acceder al valor actual del contador
  int get count => _count;

  // Método para incrementar el contador
  void increment() {
    _count++; // Suma 1 al contador
    notifyListeners(); // Notifica a los widgets que están escuchando para que se actualicen
  }

  // Método para decrementar el contador
  void decrement() {
    _count--; // Resta 1 al contador
    notifyListeners(); // Notifica el cambio
  }

  // Método para reiniciar el contador a 0
  void reset() {
    _count = 0; // Reinicia el contador
    notifyListeners(); // Notifica a los widgets
  }
}
