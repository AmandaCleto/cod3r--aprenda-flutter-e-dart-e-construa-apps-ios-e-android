import 'package:flutter/material.dart';
import 'package:lets_cook/screens/categories_meals_screen.dart';
import 'package:lets_cook/screens/categories_screens.dart';
import 'package:lets_cook/theme/pallete.dart';
import 'package:lets_cook/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Palette.kToDark,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                color: Colors.black,
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
      home: const CategoriesScreen(),
      routes: {
        AppRoutes.CATEGORIES_MEALS: (contexto) => CategoriesMealsScreen(),
      },
    );
  }
}
