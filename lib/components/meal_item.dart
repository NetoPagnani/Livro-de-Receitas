import 'package:flutter/material.dart';
import 'package:tabs/models/meal.dart';
import '../models/meal.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal);
  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    )
        .then((result) {
      if (result == null) {
        print('Sem Resultado');
      } else {
        print('O nome da refeição é $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        color: Color.fromARGB(255, 207, 207, 207),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black45,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${meal.duration} min',
                        style: const TextStyle(
                          fontFamily: 'Arima',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.blender_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.complexityText,
                        style: const TextStyle(
                          fontFamily: 'Arima',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.costText,
                        style: const TextStyle(
                          fontFamily: 'Arima',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
