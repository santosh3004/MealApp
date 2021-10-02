import 'package:MealApp/models/meal.dart';

import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_Data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var loadedInitData = false;

  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.retainWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            url: displayedMeals[index].imageUrl,
            affordability: displayedMeals[index].affordability,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
