import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  const FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeal[index]);
        },
      );
    }
  }
}
