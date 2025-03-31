import 'package:flutter/material.dart';
import 'package:tallergorouter/models/meal.dart';
import 'package:tallergorouter/services/comida_service.dart';
import 'package:go_router/go_router.dart';

class MealListView extends StatefulWidget {
  const MealListView({super.key});

  @override
  State<MealListView> createState() => _MealListViewState();
}

class _MealListViewState extends State<MealListView> {
  final MealService _mealService = MealService();
  late Future<List<Meal>> _futureMeals;

  @override
  void initState() {
    super.initState();
    _futureMeals = _mealService.getMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Comidas')),
      body: FutureBuilder<List<Meal>>(
        future: _futureMeals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay comidas disponibles'));
          }

          final meals = snapshot.data!;
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    meal.strMealThumb,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(meal.strMeal),
                  onTap: () {
                    context.go('/meals/${meal.idMeal}');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
