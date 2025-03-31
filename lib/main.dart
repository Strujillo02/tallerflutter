import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tallergorouter/routes/app_router.dart';

import 'themes/app_theme.dart'; // Importa el tema

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //! Importante para que funcione el dotenv, inicializa el widget

  //!carga el archivo .env en la raiz del proyecto
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //go_router para navegacion
    return MaterialApp.router(
      theme:
          AppTheme.lightTheme, //thema personalizado y permamente en toda la app
      title: 'Flutter - UCEVA', // Usa el tema personalizado
      routerConfig: appRouter, // Usa el router configurado
    );
  }
}
