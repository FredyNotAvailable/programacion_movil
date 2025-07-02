import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isRegistering = false;
  bool _showPassword = false;
  String? _errorMessage;

  Future<void> _signInOrRegister() async {
    try {
      if (_isRegistering) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Auto-login tras registro
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
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
    final isButtonEnabled = isEmailValid && isPasswordNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text(_isRegistering ? 'Registrar' : 'Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
