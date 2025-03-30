import 'package:flutter/material.dart';
import 'package:tallergorouter/models/Profesional.dart';
import 'package:tallergorouter/services/profesional_service.dart';

class ProfesionalDetailView extends StatefulWidget {
  final String name;

  const ProfesionalDetailView({super.key, required this.name});

  @override
  State<ProfesionalDetailView> createState() => _ProfesionalDetailViewState();
}

class _ProfesionalDetailViewState extends State<ProfesionalDetailView> {
  // Se crea una instancia de la clase PokemonService
  final ProfesionalService _profesionalService = ProfesionalService();
  // Se declara una variable de tipo Future que contendrá el detalle del Pokémon
  late Future<Profesional> _futureProfesional;

  @override
  void initState() {
    super.initState();
    // Se llama al método getPokemonByName de la clase PokemonService
    _futureProfesional = _profesionalService.getProfesionalByName(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de ${widget.name.toUpperCase()}')),
      //* se usa future builder para construir widgets basados en un Future
      body: FutureBuilder<Profesional>(
        future: _futureProfesional,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final profesional =
                snapshot.data!; // Se obtiene el detalle del Pokémon
            return Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Imagen del Pokémon
                      //! se utiliza la clase Image.network para cargar una imagen desde una url
                      const SizedBox(height: 16),

                      // Nombre del Pokémon
                      Text(
                        profesional.name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Nombre del Pokémon
                      Text(
                        profesional.email.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Tipos del Pokémon
                      //el widget Wrap se utiliza para envolver a los chips y que se ajusten al tamaño del contenedor
                      Wrap(
                        spacing: 8,
                        children:
                            profesional.types.map((type) {
                              return Chip(
                                label: Text(type.toUpperCase()),
                                backgroundColor: Colors.blueGrey.shade100,
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
