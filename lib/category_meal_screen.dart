import 'package:flutter/material.dart';

class CategoryMeanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipes'),
      ),
      body: Center(
        child: Text('The Recipes for The Category'),
      ),
    );
  }
}
