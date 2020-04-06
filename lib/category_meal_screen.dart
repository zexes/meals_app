import 'package:flutter/material.dart';

import './dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String id = "category_meal_screen";

//  final String categoryId;
//  final String categoryTitle;
//
//  const CategoryMealScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    // i use dynamic: reason being that arguments passed can be anything from String, int, Function etc

    final String categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (ctx, index) => Divider(),
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
