import 'dart:async'; // Importa la librería para trabajar con temporizadores y asincronía.
import 'package:flutter/material.dart'; // Importa los widgets y herramientas de Flutter.
import 'package:tallergorouter/views/base_view.dart'; // Importa una vista base personalizada.

class TimerView extends StatefulWidget {
  // Declara un StatefulWidget llamado TimerView.
  const TimerView({super.key}); // Constructor de la clase TimerView.

  @override
  State<TimerView> createState() => _TimerViewState(); // Crea el estado asociado al widget.
}

class _TimerViewState extends State<TimerView> {
  // Clase que define el estado del widget TimerView.
  late Timer _timer; // Declara un temporizador que será inicializado más tarde.
  int _contador = 0; // Variable para almacenar el valor del contador.
  int _indiceSeleccionado = 0; // Índice seleccionado en el BottomNavigationBar.

  @override
  void initState() {
    // Método que se ejecuta al inicializar el estado del widget.
    super.initState(); // Llama al método initState de la clase padre.
  }

  void _iniciarTemporizador() {
    // Método para iniciar el temporizador.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Ejecuta una función cada segundo.
      setState(() {
        // Actualiza el estado del widget.
        _contador++; // Incrementa el contador en 1.
      });
    });
  }

  void _reiniciarTemporizador() {
    // Método para reiniciar el temporizador.
    _contador = 0; // Reinicia el contador a 0.
  }

  void _pausarTemporizador() {
    // Método para pausar el temporizador.
    _timer.cancel(); // Cancela el temporizador.
  }

  @override
  void dispose() {
    // Método que se ejecuta cuando el widget se elimina del árbol de widgets.
    _timer.cancel(); // Cancela el temporizador para evitar fugas de memoria.
    super.dispose(); // Llama al método dispose de la clase padre.
  }

  void _itemSeleccionado(int index) {
    // Método para cambiar de sección en el BottomNavigationBar.
    setState(() {
      // Actualiza el estado del widget.
      _indiceSeleccionado = index; // Cambia el índice seleccionado.
    });
  }

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz del widget.
    List<Widget> paginas = [
      // Lista de widgets para las páginas.
      Center(
        // Página que muestra el contador.
        child: Text(
          // Muestra el valor del contador.
          'Segundos: $_contador', // Texto con el valor del contador.
          style: const TextStyle(
            fontSize: 28,
          ), // Estilo del texto (tamaño de fuente 28).
        ),
      ),
      const Padding(
        // Página que muestra información sobre el temporizador.
        padding: EdgeInsets.all(
          16.0,
        ), // Padding de 16 píxeles alrededor del texto.
        child: Text(
          // Texto explicativo.
          'Este ejemplo usa Timer.periodic para aumentar el contador '
          'automáticamente cada segundo. ', // Explicación del funcionamiento del temporizador.
          style: TextStyle(
            fontSize: 18,
          ), // Estilo del texto (tamaño de fuente 18).
        ),
      ),
    ];

    return BaseView(
      // Retorna un widget BaseView personalizado.
      title: 'Timer - TabBar ', // Título de la vista.
      body: Column(
        // Cuerpo de la vista.
        children: [
          Row(
            // Fila con los botones de control del temporizador.
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceAround, // Distribuye los botones de manera uniforme.
            children: <Widget>[
              SizedBox(
                // Botón para pausar el temporizador.
                width: 75, // Ancho del botón.
                height: 75, // Alto del botón.
                child: ElevatedButton(
                  // Botón elevado.
                  onPressed:
                      () =>
                          _pausarTemporizador(), // Llama al método para pausar el temporizador.
                  child: Icon(Icons.pause), // Icono de pausa.
                ),
              ),
              SizedBox(
                // Botón para reiniciar el temporizador.
                width: 75, // Ancho del botón.
                height: 75, // Alto del botón.
                child: ElevatedButton(
                  // Botón elevado.
                  onPressed:
                      () =>
                          _reiniciarTemporizador(), // Llama al método para reiniciar el temporizador.
                  child: Icon(Icons.restore), // Icono de reinicio.
                ),
              ),
              SizedBox(
                // Botón para iniciar el temporizador.
                width: 75, // Ancho del botón.
                height: 75, // Alto del botón.
                child: ElevatedButton(
                  // Botón elevado.
                  onPressed:
                      () =>
                          _iniciarTemporizador(), // Llama al método para iniciar el temporizador.
                  child: Icon(Icons.play_arrow), // Icono de reproducción.
                ),
              ),
            ],
          ),
          Expanded(
            child: paginas[_indiceSeleccionado],
          ), // Muestra la página seleccionada.
          BottomNavigationBar(
            // Barra de navegación inferior.
            currentIndex:
                _indiceSeleccionado, // Índice de la página seleccionada.
            onTap: _itemSeleccionado, // Cambia la página al tocar un ítem.
            selectedItemColor:
                Colors.blueAccent, // Color del ítem seleccionado.
            unselectedItemColor:
                Colors.grey, // Color de los ítems no seleccionados.
            items: const [
              // Ítems del BottomNavigationBar.
              BottomNavigationBarItem(
                icon: Icon(Icons.timer), // Icono del primer ítem.
                label: 'Contador', // Etiqueta del primer ítem.
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restore), // Icono del segundo ítem.
                label: 'Reiniciar', // Etiqueta del segundo ítem.
              ),
            ],
          ),
        ],
      ),
    );
  }
}
