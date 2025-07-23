class UsuarioModel {
  final String id;
  final String nombre;
  final String correo;
  final String rol; // "docente" o "estudiante"

  UsuarioModel({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.rol,
  });

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      id: map['id'] ?? '',
      nombre: map['nombre'] ?? '',
      correo: map['correo'] ?? '',
      rol: map['rol'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'correo': correo,
      'rol': rol,
    };
  }
}
