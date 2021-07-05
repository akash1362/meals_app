import 'package:flutter/material.dart';
import 'package:meals_app/Models/meals.dart';

class ThisMeal extends StatefulWidget {
  final List<Meal> myFavories;
  static const String routeName = '/ThisMeal';

  ThisMeal(this.myFavories);

  @override
  _ThisMealState createState() => _ThisMealState();
}

class _ThisMealState extends State<ThisMeal> {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  void _changefav(bool cond, Meal meal) {
    setState(() {
      if (cond)
        widget.myFavories.remove(meal);
      else
        widget.myFavories.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Meal>;
    final Meal selectedMeal = routeargs['Meal'] as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        actions: [
          widget.myFavories.contains(selectedMeal)
              ? IconButton(
                  icon: Icon(Icons.star),
                  onPressed: () => _changefav(true, selectedMeal),
                )
              : IconButton(
                  onPressed: () => _changefav(false, selectedMeal),
                  icon: Icon(Icons.star_border),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(selectedMeal.id);
        },
      ),
    );
  }
}
