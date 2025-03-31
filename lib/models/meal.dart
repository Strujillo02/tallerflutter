class Meal {
  // Define una clase llamada Meal que representa una comida.
  final String idMeal; // Identificador único de la comida.
  final String strMeal; // Nombre de la comida.
  final String strMealThumb; // URL de la imagen de la comida.

  Meal({
    // Constructor de la clase Meal.
    required this.idMeal, // Requiere el identificador único de la comida.
    required this.strMeal, // Requiere el nombre de la comida.
    required this.strMealThumb, // Requiere la URL de la imagen de la comida.
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    // Método de fábrica para crear una instancia de Meal a partir de un JSON.
    return Meal(
      idMeal:
          json['idMeal'], // Asigna el valor de 'idMeal' del JSON al atributo idMeal.
      strMeal:
          json['strMeal'], // Asigna el valor de 'strMeal' del JSON al atributo strMeal.
      strMealThumb:
          json['strMealThumb'], // Asigna el valor de 'strMealThumb' del JSON al atributo strMealThumb.
    );
  }
}
