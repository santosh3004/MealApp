import 'package:MealApp/dummy_data.dart';
import 'package:MealApp/screen/category_meal_screen.dart';
import 'package:MealApp/screen/filterScreen.dart';
import 'package:MealApp/screen/mealdetail_screen.dart';
import 'package:MealApp/screen/tabScreen.dart';
import 'package:flutter/material.dart';
import './screen/categories_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  bool isMealFav(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway'),
      //home: CategoriesScreen(),z
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(favoriteMeals),
        '/category-meals': (ctx) => CategoryMealScreen(availableMeals),
        MealDeatailScreen.routeName: (ctx) =>
            MealDeatailScreen(toggleFavorite, isMealFav),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, setFilters),
      },
    );
  }
}
