import 'package:flutter/material.dart';
import 'package:tallergorouter/models/meal.dart';
import 'package:tallergorouter/services/comida_service.dart';

class MealDetailView extends StatefulWidget {
  final String idMeal;

  const MealDetailView({super.key, required this.idMeal});

  @override
  State<MealDetailView> createState() => _MealDetailViewState();
}

class _MealDetailViewState extends State<MealDetailView> {
  final MealService _mealService = MealService();
  late Future<Meal> _futureMeal;

  @override
  void initState() {
    super.initState();
    _futureMeal = _mealService.getMealById(widget.idMeal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles de la Comida')),
      body: FutureBuilder<Meal>(
        future: _futureMeal,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No hay datos disponibles'));
          }

          final meal = snapshot.data!;
          return Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      meal.strMealThumb,
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      meal.strMeal.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
