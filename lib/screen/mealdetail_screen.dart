import 'package:flutter/material.dart';
import 'package:MealApp/dummy_data.dart';

class MealDeatailScreen extends StatelessWidget {
  final Function toggle;
  final Function favMeal;
  MealDeatailScreen(this.toggle, this.favMeal);
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Ingredients',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  border: Border.all(color: Colors.brown[200])),
              height: 122,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.pink[50],
                  child: Text(selectedmeal.ingredients[index]),
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Steps',
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  border: Border.all(color: Colors.brown[200])),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedmeal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(favMeal(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggle(mealId),
      ),
    );
  }
}
