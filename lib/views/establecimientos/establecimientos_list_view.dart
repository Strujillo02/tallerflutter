import 'package:flutter/material.dart';
import 'package:tallergorouter/models/establecimiento.dart';
import 'package:tallergorouter/services/establecimiento_services.dart';
import 'package:go_router/go_router.dart';
import 'package:tallergorouter/views/base_view.dart';

class EstablecimientosListView extends StatefulWidget {
  const EstablecimientosListView({super.key});

  @override
  EstablecimientosListViewState createState() =>
      EstablecimientosListViewState();
}

class EstablecimientosListViewState extends State<EstablecimientosListView> {
  final EstablecimientoService _service = EstablecimientoService();
  late Future<List<Establecimiento>> _future;

  @override
  void initState() {
    super.initState();
    //! Se inicializa el futuro para obtener los establecimientos
    _future = _service.getEstablecimientos();
  }

  //! metodo para navegar a la vista de editar establecimiento
  //! Recibe el id del establecimiento a editar
  Future<void> _goToEdit(int id) async {
    final result = await context.push('/establecimientos/edit/$id');

    // ! Si el resultado es true, significa que se actualizó algo
    // ! y se recarga la lista de establecimientos
    //! se usa cuando retorna luego de editar un establecimiento
    if (result == true) {
      setState(() {
        _future = _service.getEstablecimientos(); //  recarga los datos
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: 'Establecimientos',
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              final result = await context.push('/establecimientos/create');

              if (result == true) {
                setState(() {
                  _future =
                      _service.getEstablecimientos(); //  recarga los datos
                });
              }
            },
            child: Text('Agregar Establecimiento'),
          ),
          Expanded(
            child: FutureBuilder<List<Establecimiento>>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No hay establecimientos disponibles'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final establecimiento = snapshot.data![index];
                    return GestureDetector(
                      onTap: () => _goToEdit(establecimiento.id),
                      child: Card(
                        margin: EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child:
                                    establecimiento.logo.isNotEmpty
                                        ? Image.network(
                                          '${_service.baseUrlImg}${establecimiento.logo}',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        )
                                        : Icon(
                                          Icons.image_not_supported,
                                          size: 80,
                                        ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      establecimiento.nombre,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('NIT: ${establecimiento.nit}'),
                                    Text(
                                      'Dirección: ${establecimiento.direccion}',
                                    ),
                                    Text(
                                      'Teléfono: ${establecimiento.telefono}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
