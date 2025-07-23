import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioProvider extends ChangeNotifier {
  String? id;
  String? nombre;
  String? correo;
  String? rol;

  bool _cargando = false;
  bool get cargando => _cargando;

  // Limpia datos (por ejemplo, al cerrar sesión)
  void limpiarUsuario() {
    id = null;
    nombre = null;
    correo = null;
    rol = null;
    notifyListeners();
  }

  // Cargar usuario desde Firestore por uid
  Future<void> cargarUsuario(String uid) async {
    _cargando = true;
    notifyListeners();

    try {
      final doc = await FirebaseFirestore.instance.collection('usuarios').doc(uid).get();
      if (doc.exists) {
        final data = doc.data()!;
        id = data['id'] as String?;
        nombre = data['nombre'] as String?;
        correo = data['correo'] as String?;
        rol = data['rol'] as String?;
      } else {
        // Si no existe, limpia datos (o maneja error)
        limpiarUsuario();
      }
    } catch (e) {
      limpiarUsuario();
    } finally {
      _cargando = false;
      notifyListeners();
    }
  }
}
