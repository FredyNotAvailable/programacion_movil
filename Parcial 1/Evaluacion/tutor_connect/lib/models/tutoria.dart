import 'package:tutor_connect/models/materia.dart';
import 'package:tutor_connect/models/docente.dart';

class Tutoria {
  final Materia materia;
  final Docente docente;
  final DateTime fecha;

  Tutoria({
    required this.materia,
    required this.docente,
    required this.fecha,
  });
}
