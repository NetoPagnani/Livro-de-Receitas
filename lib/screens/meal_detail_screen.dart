import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScren extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScren(this.onToggleFavorite, this.isFavorite);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'DancingScript',
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 330,
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 201, 200, 200),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(
            color: Colors.yellow,
            fontFamily: 'Arima',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(
                          fontFamily: 'Arima',
                          fontSize: 15,
                        ),
                      ),
                    ),
                    color: Colors.limeAccent,
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                          backgroundColor: Colors.redAccent,
                        ),
                        title: Text(
                          meal.steps[index],
                          style: const TextStyle(
                              fontFamily: 'Arima',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
