import 'package:flutter/material.dart';
import 'package:proyecto_ciclo/actividades_page.dart';
import 'package:proyecto_ciclo/clases_page.dart';

// Asegúrate de importar tus páginas reales
import 'home_page.dart';
import 'settings_page.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const settings = '/settings';
  static const clases = '/clases';
  static const actividades = '/actividades';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case AppRoutes.settings:
        return MaterialPageRoute(builder: (context) => const SettingsPage());

      case AppRoutes.clases:
        return MaterialPageRoute(builder: (context) => const ClasesPage());

      case AppRoutes.actividades:
        return MaterialPageRoute(builder: (context) => const ActividadesPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
