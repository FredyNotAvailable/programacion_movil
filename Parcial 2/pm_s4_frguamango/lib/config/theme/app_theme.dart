import 'package:flutter/material.dart';

// Color personalizado con opacidad visible (255 = totalmente opaco)
const Color _customColor = Color.fromARGB(255, 1, 1, 1);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.teal,
  Colors.green,
  Colors.pink,
  Colors.white12, // Coma agregada aquí
];

class AppTheme {
  final int selectedColor;

  AppTheme({
    required this.selectedColor,
  }) : assert(
          selectedColor >= 0 && selectedColor < _colorThemes.length,
          "El índice de color debe estar entre 0 y ${_colorThemes.length - 1}",
        );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light,
    );
  }
}
