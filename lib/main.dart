import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';
import 'model/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  //TODO -1 create filters class and refactor
  //TODO -2 use provider package to move data around e.g favoriteMeals and available meals
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
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

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.yellow,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'RaleWay',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
//      home: CategoriesScreen(),
      initialRoute: TabsScreen.id,
      routes: {
        TabsScreen.id: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoriesScreen.id: (ctx) => CategoriesScreen(),
        CategoryMealScreen.id: (ctx) =>
            CategoryMealScreen(availableMeals: _availableMeals),
        MealDetailScreen.id: (ctx) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: _isMealFavorite),
        FiltersScreen.id: (ctx) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            )
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        //watch video again for your need
        //when route us not defined in routes
        //useful while still building your app to assist to do some navigation
        //till you generate define screen
      },
      onUnknownRoute: (settings) {
        //more like error handler 404
        //fall back
        //if error occurs, build a not found screen n define here
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
