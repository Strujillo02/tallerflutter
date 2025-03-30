import 'package:go_router/go_router.dart';
import 'package:tallergorouter/future/future_view.dart';
import 'package:tallergorouter/profesionales/profesional_detail_view.dart';
import 'package:tallergorouter/profesionales/profesional_list_view.dart';
import 'package:tallergorouter/views/ciclo_vida/ciclo_vida_screen.dart';
import 'package:tallergorouter/paso_parametros/detalle_screen.dart';
import 'package:tallergorouter/paso_parametros/paso_parametros_screen.dart';
import 'package:tallergorouter/views/grid_view.dart';
import 'package:tallergorouter/views/home_view.dart';
import 'package:tallergorouter/views/isolate/isolate_view.dart';
import 'package:tallergorouter/views/tabbar_view.dart';
import 'package:tallergorouter/views/timer/timer_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(), // Usa HomeView
    ),
    GoRoute(
      path: '/gridview',
      builder: (context, state) => const GridView1(), // Usa HomeView
    ),
    GoRoute(
      path: '/tabbar',
      builder: (context, state) => const TabbarView1(), // Usa HomeView
    ),
    GoRoute(
      path: '/paso_parametros',
      builder: (context, state) => const PasoParametrosScreen(),
    ),
    // !Ruta para el detalle con parámetros
    GoRoute(
      path:
          '/detalle/:parametro/:metodo', //la ruta recibe dos parametros los " : " indican que son parametros
      builder: (context, state) {
        //*se capturan los parametros recibidos
        // declarando las variables parametro y metodo
        // es final porque no se van a modificar
        final parametro = state.pathParameters['parametro']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(parametro: parametro, metodoNavegacion: metodo);
      },
    ),
    GoRoute(
      path: '/ciclo_vida',
      builder: (context, state) => const CicloVidaScreen(),
    ),
    GoRoute(
      path: '/future',
      name: 'future',
      builder: (context, state) => const FutureView(),
    ),
    //!Ruta para el demo de Timer
    GoRoute(
      path: '/timer',
      name: 'timerView',
      builder: (context, state) => const TimerView(),
    ),

    //!Ruta para el demo de Isolate
    GoRoute(
      path: '/isolate', //*ruta para el demo de Isolate
      name: 'isolate', //*nombre de la ruta
      builder: (context, state) => const IsolateView(),
    ),
    GoRoute(
      path: '/profesional',
      name: 'profesionales',
      builder: (context, state) => const ProfesionalListView(),
    ),
    GoRoute(
      path: '/profesional/:name',
      name: 'profesionalDetail',
      builder:
          (context, state) =>
        ProfesionalDetailView(name: state.pathParameters['name']!),
    ),
  ],
);
