import 'package:flutter/material.dart';

// Asegúrate de importar tus páginas reales
import 'login_page.dart';
import 'home_page.dart';
import 'contact_page.dart';
import 'settings_page.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/home';
  static const settings = '/settings';
  static const contact = '/contact';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomePage());

      case AppRoutes.settings:
        return MaterialPageRoute(builder: (context) => const SettingsPage());

      case AppRoutes.contact:
        return MaterialPageRoute(builder: (context) => const ContactPage());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Ruta no encontrada')),
          ),
        );
    }
  }
}
