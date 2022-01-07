import 'package:flutter/material.dart';
import 'package:lets_cook/model/meal.dart';
import 'package:lets_cook/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _selectMeal() {
      Navigator.of(context)
          .pushNamed(
        AppRoutes.MEAL_DETAIL,
        arguments: meal,
      )
          .then((result) {
        if (result == null) {
          print('Sem resultado!');
        } else {
          print('O nome da refeição é $result.');
        }
      });
    }

    return InkWell(
      onTap: _selectMeal,
      child: Card(
        color: const Color.fromRGBO(244, 244, 244, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
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
                  top: 20,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(229, 95, 72, 0.9),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Color.fromRGBO(244, 244, 244, 1),
                            ),
                            Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Color.fromRGBO(244, 244, 244, 1),
                            ),
                            Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Color.fromRGBO(244, 244, 244, 1),
                            ),
                            Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Color.fromRGBO(244, 244, 244, 1),
                            ),
                          ]),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '${meal.duration} min',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work_outline_rounded,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.complexityText,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.green.shade700,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        meal.costText,
                        style: TextStyle(
                          color: Colors.green.shade700,
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
