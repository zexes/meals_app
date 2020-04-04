import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static String id = "category_meal_screen";

//  final String categoryId;
//  final String categoryTitle;
//
//  const CategoryMealScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    String categoryTitle = routeArgs['title'];
    String categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The Recipes for The Category'),
      ),
    );
  }
}
