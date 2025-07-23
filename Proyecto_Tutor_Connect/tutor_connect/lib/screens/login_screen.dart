import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';  // <-- Importa Firestore

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _rolSeleccionado;
  bool _isRegistering = false;
  bool _showPassword = false;
  String? _errorMessage;

  Future<void> _signInOrRegister() async {
    try {
      if (_isRegistering) {
        if (_rolSeleccionado == null || _nombreController.text.trim().isEmpty) {
          setState(() {
            _errorMessage = 'Por favor completa nombre y rol';
          });
          return;
        }

        // Crear usuario en Firebase Auth
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Guardar datos extendidos en Firestore
        final uid = userCredential.user!.uid;
        final userData = {
          'id': uid,
          'nombre': _nombreController.text.trim(),
          'correo': _emailController.text.trim(),
          'rol': _rolSeleccionado,
          'createdAt': FieldValue.serverTimestamp(),
        };

        await FirebaseFirestore.instance.collection('usuarios').doc(uid).set(userData);

        // No necesitas hacer signInWithEmailAndPassword porque ya queda autenticado automáticamente

      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
      setState(() => _errorMessage = null);
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = e.message);
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final isEmailValid = _isValidEmail(_emailController.text.trim());
    final isPasswordNotEmpty = _passwordController.text.isNotEmpty;
    final isNombreNotEmpty = _nombreController.text.trim().isNotEmpty;
    final isRolSelected = _rolSeleccionado != null;

    final isButtonEnabled = _isRegistering
        ? isEmailValid && isPasswordNotEmpty && isNombreNotEmpty && isRolSelected
        : isEmailValid && isPasswordNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text(_isRegistering ? 'Registrar' : 'Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_isRegistering)
              TextField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre completo'),
                onChanged: (_) => setState(() {}),
              ),
            if (_isRegistering)
              DropdownButtonFormField<String>(
                value: _rolSeleccionado,
                decoration: const InputDecoration(labelText: 'Selecciona rol'),
                items: const [
                  DropdownMenuItem(value: 'docente', child: Text('Docente')),
                  DropdownMenuItem(value: 'estudiante', child: Text('Estudiante')),
                ],
                onChanged: (val) => setState(() => _rolSeleccionado = val),
              ),
            if (_isRegistering) const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _showPassword = !_showPassword),
                ),
              ),
              obscureText: !_showPassword,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: isButtonEnabled ? _signInOrRegister : null,
              child: Text(_isRegistering ? 'Registrar' : 'Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isRegistering = !_isRegistering;
                  _errorMessage = null;
                  // Limpiar campos cuando cambias modo
                  _nombreController.clear();
                  _rolSeleccionado = null;
                });
              },
              child: Text(_isRegistering
                  ? '¿Ya tienes cuenta? Inicia sesión'
                  : '¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
