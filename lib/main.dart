import 'package:flutter/material.dart';
import 'package:meals_app/Screens/FavoritesScreen.dart';
import '../Models/FilterChecks.dart';
import '../Models/dummy_data.dart';
import '../Screens/Filters.dart';
import '../Screens/HomePage.dart';
import '../Screens/thisMeal.dart';
import '../Screens/MealCategoryScreen.dart';
import '../Models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterCheck _filters = FilterCheck(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVegetarian: false,
  );

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favorites = [];

  void _setFilters(FilterCheck fil) {
    setState(() {
      _filters = fil;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters.isGlutenFree && !meal.isGlutenFree) return false;
        if (_filters.isVegan && !meal.isVegan) return false;
        if (_filters.isVegetarian && !meal.isVegetarian) return false;
        if (_filters.isLactoseFree && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: HomePage(_favorites),
      routes: {
        '/meal-category': (ctx) => MealCategoryScreen(_availableMeals),
        ThisMeal.routeName: (ctx) => ThisMeal(_favorites),
        Filters.routName: (ctx) => Filters(_filters, _setFilters),
      },
    );
  }
}
