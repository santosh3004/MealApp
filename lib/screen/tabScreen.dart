import 'package:MealApp/models/meal.dart';
import 'package:MealApp/screen/categories_screen.dart';
import 'package:MealApp/screen/favoriteScreen.dart';
import 'package:MealApp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> pages;
  int selectedPageIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavScreen(widget.favoriteMeals), 'title': 'Favorites'}
    ];
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(tabs: <Widget>[
    //         Tab(
    //           icon: Icon(
    //             Icons.category,
    //           ),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favorites',
    //         )
    //       ]),
    //     ),
    //     body: TabBarView(
    //       children: [CategoriesScreen(), FavScreen()],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.yellow[300],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.green[300],
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Favorites")),
        ],
      ),
    );
  }
}
