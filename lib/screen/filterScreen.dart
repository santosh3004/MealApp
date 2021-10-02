import 'package:MealApp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilter;
  FilterScreen(this.currentFilter, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    glutenFree = widget.currentFilter['gluten'];
    lactoseFree = widget.currentFilter['lactose'];
    vegan = widget.currentFilter['vegan'];
    vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal slection'),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('Gluten Free'),
                    value: glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose Free'),
                    value: lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: vegetarian,
                    onChanged: (newValue) {
                      setState(() {
                        vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: vegan,
                    onChanged: (newValue) {
                      setState(() {
                        vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
