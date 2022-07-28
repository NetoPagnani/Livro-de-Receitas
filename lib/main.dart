import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
import 'screens/categories_meals_sreen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/app_routes.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'data/dummy_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  Settings settings = Settings();

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeal.contains(meal)
          ? _favoriteMeal.remove(meal)
          : _favoriteMeal.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeal.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      theme: ThemeData(
        fontFamily: 'Arima',
        canvasColor: Color.fromARGB(215, 246, 187, 106),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'PermanentMarker',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(secondary: Colors.amber),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeal),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScren(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScrenn(settings, _filterMeals),
      },
    );
  }
}
