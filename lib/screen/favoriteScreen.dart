import 'package:MealApp/models/meal.dart';
import 'package:MealApp/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('No Favorites Yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            url: favoriteMeals[index].imageUrl,
            affordability: favoriteMeals[index].affordability,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
