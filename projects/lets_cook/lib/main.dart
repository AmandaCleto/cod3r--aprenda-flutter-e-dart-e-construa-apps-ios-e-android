import 'package:flutter/material.dart';
import 'package:lets_cook/data/dummy_data.dart';
import 'package:lets_cook/model/meal.dart';
import 'package:lets_cook/model/settings.dart';
import 'package:lets_cook/screens/categories_meals_screen.dart';
import 'package:lets_cook/screens/meal_detail_screen.dart';
import 'package:lets_cook/screens/settings_screen.dart';
import 'package:lets_cook/screens/tabs_screen.dart';
import 'package:lets_cook/theme/pallete.dart';
import 'package:lets_cook/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

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
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Palette.kToDark,
        ),
        canvasColor: const Color.fromRGBO(237, 225, 223, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoCondensed',
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
          ),
        ),
      ),
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (contexto) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORIES_MEALS: (contexto) => CategoriesMealsScreen(
              meals: _availableMeals,
            ),
        AppRoutes.MEAL_DETAIL: (contexto) => MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.SETTINGS: (contexto) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            )
      },
    );
  }
}
