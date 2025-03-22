import 'package:flutter/material.dart';
import 'package:tallergorouter/views/base_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'UCEVA', // Título de la pantalla
      body: Column(
        children: [
          const Center(child: Text('Bienvenido a la pantalla de inicio')),
        ],
      ),
      //
    );
  }
}
