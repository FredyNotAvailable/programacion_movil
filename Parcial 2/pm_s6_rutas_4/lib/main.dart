import 'package:flutter/material.dart';
import 'package:pm_s6_rutas_4/app_routes.dart';

void main() => runApp(const MyApp());

// Widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegacion',
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

// // Página de inicio con botón para navegar
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   void _goToPageContact(BuildContext context) {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => const ContactPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Inicio')
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration:  BoxDecoration(color: Colors.blue),
//               child: Text('Menu', style: TextStyle(color: Colors.white),
//               )),
//               ListTile(
//                 leading: Icon(Icons.contact_page),
//                 title: Text('Contactos'),
//                 onTap: () => _goToPageContact(context),
//               )
//           ],
//         ),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _goToPageContact(context),
//           child: const Text('Ir a contacto'),
//         ),
//       ),
//     );
//   }
// }

// // Página de contacto (antes llamada "name")
// class ContactPage extends StatelessWidget {
//   const ContactPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Página contacto'),
//       ),
//       body: const Center(
//         child: Text('Página de contactos'),
//       ),
//     );
//   }
// }
