import 'package:flutter/material.dart';
import 'package:lets_cook/components/meal_item.dart';
import 'package:lets_cook/model/category.dart';
import 'package:lets_cook/model/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsScreen({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (contexto, index) {
            return MealItem(
              meal: categoryMeals[index],
            );
          },
        ),
      ),
    );
  }
}
