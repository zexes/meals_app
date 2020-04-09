import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      initialRoute: CategoriesScreen.id,
      routes: {
        CategoriesScreen.id: (ctx) => CategoriesScreen(),
        CategoryMealScreen.id: (ctx) => CategoryMealScreen(),
        MealDetailScreen.id: (ctx) => MealDetailScreen()
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
