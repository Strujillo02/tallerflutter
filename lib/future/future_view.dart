import 'dart:async'; // Importa la librería para trabajar con Future y asincronía.
import 'package:flutter/material.dart'; // Importa los widgets y herramientas de Flutter.
import 'package:tallergorouter/views/base_view.dart'; // Importa una vista base personalizada.

class FutureView extends StatefulWidget {
  // Declara un StatefulWidget llamado FutureView.
  const FutureView({super.key}); // Constructor de la clase FutureView.

  @override
  State<FutureView> createState() => _FutureViewState(); // Crea el estado asociado al widget.
}

class _FutureViewState extends State<FutureView> {
  // Clase que define el estado del widget FutureView.
  List<String> _nombres =
      []; // Declara una lista vacía para almacenar los nombres.

  @override
  void initState() {
    // Método que se ejecuta al inicializar el estado del widget.
    super.initState(); // Llama al método initState de la clase padre.
    obtenerDatos(); // Llama a la función obtenerDatos para cargar los datos al iniciar.
  }

  Future<List<String>> cargarNombres() async {
    // Función que simula la carga de datos.
    await Future.delayed(
      const Duration(seconds: 5),
    ); // Espera 5 segundos para simular una carga.
    return [
      // Retorna una lista de nombres después de la espera.
      'Juan', 'Pedro', 'Luis', 'Ana', 'Maria', 'Jose', 'Carlos', 'Sofia',
      'Laura', 'Fernando', 'Ricardo', 'Diana', 'Elena', 'Miguel', 'Rosa',
      'Luz', 'Carmen', 'Pablo', 'Jorge', 'Roberto',
    ];
  }

  Future<void> obtenerDatos() async {
    // Función que obtiene los datos y los asigna a la lista.
    final datos =
        await cargarNombres(); // Llama a cargarNombres y espera los datos.

    if (!mounted)
      return; // Verifica si el widget sigue montado antes de actualizar el estado.
    setState(() {
      // Actualiza el estado del widget.
      _nombres = datos; // Asigna los datos obtenidos a la lista _nombres.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz del widget.
    return BaseView(
      // Retorna un widget BaseView personalizado.
      title: 'Lista de estudiantes', // Título de la vista.
      body: // Cuerpo de la vista.
          _nombres
                  .isEmpty // Verifica si la lista _nombres está vacía.
              ? const Center(
                child: CircularProgressIndicator(),
              ) // Muestra un indicador de carga si está vacía.
              : Padding(
                // Si no está vacía, muestra el contenido con un padding.
                padding: const EdgeInsets.all(
                  10.0,
                ), // Define un padding de 10 píxeles.
                child: GridView.builder(
                  // Crea un GridView dinámico.
                  itemCount:
                      _nombres.length, // Número de elementos en la lista.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // Configura el diseño del grid.
                    crossAxisCount: 1, // Número de columnas en el grid.
                    mainAxisSpacing:
                        10, // Espaciado vertical entre los elementos.
                    crossAxisSpacing:
                        10, // Espaciado horizontal entre los elementos.
                    childAspectRatio:
                        2, // Relación de aspecto de los elementos.
                  ),
                  itemBuilder: (context, index) {
                    // Construye cada elemento del grid.
                    return Card(
                      // Retorna un widget Card para cada elemento.
                      color: const Color.fromARGB(
                        255,
                        87,
                        194,
                        180,
                      ), // Color de fondo del Card.
                      child: Center(
                        // Centra el contenido dentro del Card.
                        child: Text(
                          // Muestra el nombre en el centro del Card.
                          _nombres[index], // Obtiene el nombre correspondiente al índice.
                          style: const TextStyle(
                            fontSize: 18,
                          ), // Estilo del texto (tamaño de fuente 18).
                        ),
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
