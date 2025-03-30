import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tallergorouter/models/Profesional.dart';

class ProfesionalService {
  // ! Se obtiene la url de la api desde el archivo .env
  final String apiUrl = dotenv.env['PROFESIONAL_API_URL']!;

  // ! Método para obtener la lista de Pokémon
  // * se crea una istancia del modelo Pokemon, se hace una petición http a la url de la api y se obtiene la respuesta
  // * si el estado de la respuesta es 200 se decodifica la respuesta y se obtiene la lista de resultados
  Future<List<Profesional>> getProfesionales({int limit = 100}) async {
    final response = await http.get(
      Uri.parse('$apiUrl/profesional?limit=$limit'),
    ); //
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results']; // se obtiene la lista de resultados

      //! Se mapea la lista de resultados para obtener el detalle de cada Pokémon
      List<Future<Profesional>> futures =
          results.map((item) {
            return getProfesionalByName(item['name']);
          }).toList();
      return Future.wait(futures);
    } else {
      throw Exception('Error al obtener la lista de Pokémon.');
    }
  }

  // Método para obtener el detalle de un Pokémon por nombre
  Future<Profesional> getProfesionalByName(String name) async {
    final response = await http.get(Uri.parse('$apiUrl/profesional/$name'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Profesional.fromJson(data); // se retorna el detalle del Pokémon
    } else {
      throw Exception('Error al obtener el detalle del Pokémon');
    }
  }
}
