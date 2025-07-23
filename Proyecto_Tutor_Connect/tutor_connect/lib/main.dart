import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'providers/usuario_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tutorías App',
        theme: ThemeData(primarySwatch: Colors.blue),
        // Para probar FirestoreTestScreen, descomenta la siguiente línea:
        // home: const FirestoreTestScreen(),

        // Para producción usa AuthGate:
        home: const AuthGate(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData) {
          // Ejecutar fuera del build:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            usuarioProvider.cargarUsuario(snapshot.data!.uid);
          });

          return const HomeScreen();
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            usuarioProvider.limpiarUsuario();
          });

          return const LoginScreen();
        }
      },
    );
  }
}
