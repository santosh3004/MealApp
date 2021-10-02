import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../dummy_Data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      children: Dummy_Categories.map((catData) =>
          CategoryItem(catData.id, catData.color, catData.title)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
