import 'package:flutter/material.dart';
import 'package:lets_cook/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen({
    Key? key,
    required this.onToggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(244, 244, 244, 1),
        border: Border.all(
          width: 1,
          color: const Color.fromRGBO(229, 95, 72, 0.6),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (contexto, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 10.0,
                      ),
                      child: Text(
                        meal.ingredients[index],
                        style: const TextStyle(
                          color: Color.fromRGBO(244, 244, 244, 1),
                        ),
                      ),
                    ),
                    color: const Color.fromRGBO(229, 95, 72, 0.5),
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (contexto, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(229, 95, 72, 1),
                          foregroundColor:
                              const Color.fromRGBO(244, 244, 244, 1),
                          child: Text(
                            '${index + 1}',
                          ),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color.fromRGBO(229, 95, 72, 1),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite(meal)
            ? const Icon(
                Icons.favorite,
                color: Color.fromRGBO(244, 244, 244, 1),
              )
            : const Icon(
                Icons.favorite_border,
                color: Color.fromRGBO(244, 244, 244, 1),
              ),
        onPressed: () => onToggleFavorite(meal),
      ),
    );
  }
}
