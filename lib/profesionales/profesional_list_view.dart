import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tallergorouter/models/Profesional.dart';
import 'package:tallergorouter/services/profesional_service.dart';
import 'package:tallergorouter/views/base_view.dart';

class ProfesionalListView extends StatefulWidget {
  const ProfesionalListView({super.key});

  @override
  State<ProfesionalListView> createState() => _ProfesionalListViewState();
}

class _ProfesionalListViewState extends State<ProfesionalListView> {
  //* Se crea una instancia de la clase PokemonService
  final ProfesionalService _profesioanlService = ProfesionalService();
  //* Se declara una variable de tipo Future que contendrá la lista de Pokémon
  late Future<List<Profesional>> _futureProfesionales;

  @override
  void initState() {
    super.initState();
    //! Se llama al método getPokemons de la clase PokemonService
    _futureProfesionales = _profesioanlService.getProfesionales();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Profesional - ListView',
      //! Se crea un FutureBuilder que se encargará de construir la lista de Pokémon
      //! futurebuilder se utiliza para construir widgets basados en un Future
      body: FutureBuilder<List<Profesional>>(
        future: _futureProfesionales,
        builder: (context, snapshot) {
          //snapshot contiene la respuesta del Future
          if (snapshot.hasData) {
            //* Se obtiene la lista de Pokémon
            final Profesionales = snapshot.data!;
            //listview.builder se utiliza para construir una lista de elementos de manera eficiente
            return ListView.builder(
              itemCount: Profesionales.length,
              itemBuilder: (context, index) {
                final Profesional = Profesionales[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  //* gestureDetector se utiliza para detectar gestos del usuario
                  //* en este caso se utiliza para navegar a la vista de detalle del Pokémon
                  child: GestureDetector(
                    onTap: () {
                      context.push('/profesional/${Profesional.name}');
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Profesional.name.toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
