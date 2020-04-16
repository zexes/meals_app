import 'package:flutter/material.dart';
import 'package:mealsapp/screens/meal_detail_screen.dart';
import 'package:mealsapp/screens/tab_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  ListTile buildSectionTile(IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold //same as w700 as set in pubspec
            ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          buildSectionTile(
              Icons.restaurant,
              'Meals',
              () => Navigator.of(context).pushReplacementNamed(TabsScreen
                  .id)), //if pushReplacement, then we use MaterialPageRoute
          buildSectionTile(
              Icons.settings,
              'Filters',
              () =>
                  Navigator.of(context).pushReplacementNamed(FiltersScreen.id)),
        ],
      ),
    );
  }
}
