import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tallergorouter/views/base_view.dart';

class TimerView extends StatefulWidget {
  const TimerView({super.key});

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  //late indica que la variable será inicializada después
  //esto se usa con el fin de que la variable no sea nula
  late Timer _timer;
  int _contador = 0;
  int _indiceSeleccionado = 0; //indice seleccionado en el BottomNavigationBar

  @override
  //!initState() se llama una vez que el widget ha sido creado
  //!y se puede utilizar para inicializar datos que solo deben hacerse una vez.
  void initState() {
    super.initState();
  }

  //! Método para iniciar el temporizador
  void _iniciarTemporizador() {
    //timer.periodic() ejecuta una función cada cierto tiempo
    //en este caso cada segundo
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _contador++;
      });
    });
  }

  void _reiniciarTemporizador() {
    //timer.periodic() ejecuta una función cada cierto tiempo
    //en este caso cada segundo
    _contador = 0;
  }

  //metodo para pausar el temporizador
  void _pausarTemporizador() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timer.cancel();
      });
    });
  }

  @override
  //! dispose() se llama cuando el widget se elimina del árbol de widgets
  //! y se puede utilizar para liberar recursos o cancelar temporizadores.
  void dispose() {
    //! _timer.cancel() cancela el temporizador, requerido siempre que se use Timer
    //! evita fugas de memoria
    _timer.cancel();
    super.dispose();
  }

  //! Método para cambiar de sección
  void _itemSeleccionado(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //*Lista de Widgets para las páginas
    List<Widget> paginas = [
      Center(
        child: Text(
          'Segundos: $_contador',
          style: const TextStyle(fontSize: 28),
        ),
      ),

      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Este ejemplo usa Timer.periodic para aumentar el contador '
          'automáticamente cada segundo. ',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ];

    return BaseView(
      title: 'Timer - TabBar ',
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 75,
                height: 75,
                child: ElevatedButton(
                  onPressed: () => _timer.cancel(),
                  child: Icon(Icons.pause),
                ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: ElevatedButton(
                  onPressed: () => _reiniciarTemporizador(),
                  child: Icon(Icons.restore),
                ),
              ),
              SizedBox(
                width: 75,
                height: 75,
                child: ElevatedButton(
                  onPressed: () => _iniciarTemporizador(),
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ],
          ),
          Expanded(child: paginas[_indiceSeleccionado]),
          BottomNavigationBar(
            currentIndex: _indiceSeleccionado,
            onTap: _itemSeleccionado,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Contador',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restore),
                label: 'Reiniciar',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
