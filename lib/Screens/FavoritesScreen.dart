import 'package:flutter/material.dart';
import 'package:meals_app/Models/meals.dart';
import 'package:meals_app/Widgets/meal_items.dart';

class FavoritesScreen extends StatefulWidget {
  static const String routeName = '/FavoritesScreen';
  final List<Meal> favoritesMeals;
  FavoritesScreen(this.favoritesMeals);
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  
  

  Widget build(BuildContext context) {
    return widget.favoritesMeals.isEmpty
        ? Container(
            child: Center(
            child: Text(
                'You don\'t have any favoritesMeals.\n Start adding some!!'),
          ))
        : Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(widget.favoritesMeals[index], (_) {});
              },
              itemCount: widget.favoritesMeals.length,
            ),
          );
  }
}
