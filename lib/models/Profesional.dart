/// Modelo para representar un Pokemon con su nombre, imagen y tipos
class Profesional {
  final int id;
  final String name;
  final String email;
  final List<String> types;

  // Constructor de la clase Pokemon con los atributos requeridos
  Profesional({
    required this.id,
    required this.name,
    required this.email,
    required this.types,
  });

  // MEtodo para convertir una instancia de Pokemon a un JSON
  //factory porque es un método que retorna una nueva instancia de la clase
  factory Profesional.fromJson(Map<String, dynamic> json) {
    return Profesional(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      types: List<String>.from(json['types'].map((t) => t['type']['name'])),
    );
  }
}
