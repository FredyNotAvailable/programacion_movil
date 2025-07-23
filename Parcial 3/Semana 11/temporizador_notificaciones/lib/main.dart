import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificacionService.init();
  runApp(const MyApp());
}

class NotificacionService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: androidSettings);
    await _plugin.initialize(settings);

    // Pedir permiso para Android 13+
    if (defaultTargetPlatform == TargetPlatform.android) {
      if (await Permission.notification.isDenied) {
        await Permission.notification.request();
      }
    }
  }

  static Future<void> mostrarNotificacion({
    required int id,
    required String titulo,
    required String cuerpo,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'canal_temporizador',
      'Temporizador',
      channelDescription: 'Notificaciones cada 10 segundos',
      importance: Importance.high,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(android: androidDetails);

    await _plugin.show(id, titulo, cuerpo, notificationDetails);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Temporizador con Notificaciones',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
        home: const HomePage(title: 'Temporizador 10 segundos'),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  Timer? temporizador;

  void iniciarTemporizador() {
    temporizador?.cancel();
    temporizador = Timer.periodic(const Duration(seconds: 10), (_) async {
      contador++;
      await NotificacionService.mostrarNotificacion(
        id: contador,
        titulo: 'Temporizador',
        cuerpo: 'Han pasado ${contador * 10} segundos',
      );
      if (mounted) setState(() {});
    });
  }

  void detenerTemporizador() {
    temporizador?.cancel();
    temporizador = null;
  }

  @override
  void initState() {
    super.initState();
    iniciarTemporizador();
  }

  @override
  void dispose() {
    detenerTemporizador();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('Notificación cada 10 segundos'),
            Text('Enviadas: $contador', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: detenerTemporizador, child: const Text('Detener temporizador')),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: iniciarTemporizador, child: const Text('Reiniciar temporizador')),
          ]),
        ),
      );
}
