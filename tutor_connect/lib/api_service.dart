import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:8000/api'; // cambia esto a tu backend

  // GET - obtener lista de objetos
  Future<List<dynamic>> fetchClases() async {
    final response = await http.get(Uri.parse('$baseUrl/clases/'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar clases');
    }
  }

  // POST - crear una clase
  Future<void> createClase(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clases/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al crear clase');
    }
  }

  // PUT - actualizar clase
  Future<void> updateClase(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/clases/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al actualizar clase');
    }
  }

  // DELETE - eliminar clase
  Future<void> deleteClase(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/clases/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Error al eliminar clase');
    }
  }
}
