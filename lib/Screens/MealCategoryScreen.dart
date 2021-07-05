import 'package:flutter/material.dart';
import '../Models/meals.dart';
import '../Widgets/meal_items.dart';

class MealCategoryScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  MealCategoryScreen(this.availableMeals);
  @override
  _MealCategoryScreenState createState() => _MealCategoryScreenState();
}

class _MealCategoryScreenState extends State<MealCategoryScreen> {
  var id;
  var mealName;
  List<Meal>? thiscategoryMeal;
  bool _loadfirsttime = false;

  void _removeMeal(String removeid) {
    setState(() {
      thiscategoryMeal!.removeWhere((element) {
        return element.id == removeid;
      });
    });
  }

  void didChangeDependencies() {
    if (!_loadfirsttime) {
      final routeargs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      id = routeargs['id'];
      mealName = routeargs['title'];
      thiscategoryMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      _loadfirsttime = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$mealName'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(thiscategoryMeal![index], _removeMeal);
        },
        itemCount: thiscategoryMeal!.length,
      ),
    );
  }
}
