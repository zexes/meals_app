import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String id = "category_meal_screen";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  bool _loadedData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (ctx, index) => Divider(),
          itemBuilder: (ctx, index) {
            final meal = categoryMeals[index];
            return MealItem(
              id: meal.id,
              title: meal.title,
              affordability: meal.affordability,
              complexity: meal.complexity,
              duration: meal.duration,
              imageUrl: meal.imageUrl,
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
