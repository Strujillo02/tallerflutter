import 'dart:convert'; // Importa la librería para trabajar con JSON.
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importa dotenv para cargar variables de entorno.
import 'package:http/http.dart'
    as http; // Importa http para realizar solicitudes HTTP.
import 'package:tallergorouter/models/meal.dart'; // Importa el modelo Meal.

class MealService {
  // Define una clase llamada MealService para interactuar con la API de comidas.
  final String apiUrl =
      dotenv
          .env['MEAL_API_URL']!; // Obtiene la URL base de la API desde el archivo .env.
  late final String
  _baseUrl; // Declara una variable para almacenar la URL completa.

  MealService() {
    // Constructor de la clase MealService.
    _baseUrl =
        '$apiUrl/filter.php?c=Seafood'; // Construye la URL para obtener comidas de la categoría "Seafood".
  }

  Future<List<Meal>> getMeals() async {
    // Método para obtener una lista de comidas.
    final response = await http.get(
      Uri.parse(_baseUrl),
    ); // Realiza una solicitud GET a la URL base.

    if (response.statusCode == 200) {
      // Verifica si la respuesta tiene un código de estado 200 (éxito).
      final Map<String, dynamic> data = json.decode(
        response.body,
      ); // Decodifica la respuesta JSON en un mapa.
      final List<dynamic> mealsJson =
          data['meals']; // Extrae la lista de comidas del JSON.

      return mealsJson
          .map((json) => Meal.fromJson(json))
          .toList(); // Convierte cada elemento JSON en un objeto Meal y retorna la lista.
    } else {
      throw Exception(
        "Error al obtener las comidas",
      ); // Lanza una excepción si la solicitud falla.
    }
  }

  Future<Meal> getMealById(String idMeal) async {
    // Método para obtener los detalles de una comida por su ID.
    final response = await http.get(
      // Realiza una solicitud GET a la URL con el ID de la comida.
      Uri.parse('$apiUrl/lookup.php?i=$idMeal'),
    );

    if (response.statusCode == 200) {
      // Verifica si la respuesta tiene un código de estado 200 (éxito).
      final Map<String, dynamic> data = json.decode(
        response.body,
      ); // Decodifica la respuesta JSON en un mapa.
      final List<dynamic> mealsJson =
          data['meals']; // Extrae la lista de comidas del JSON.

      return Meal.fromJson(
        mealsJson.first,
      ); // Convierte el primer elemento JSON en un objeto Meal y lo retorna.
    } else {
      throw Exception(
        "Error al obtener los detalles de la comida",
      ); // Lanza una excepción si la solicitud falla.
    }
  }
}
