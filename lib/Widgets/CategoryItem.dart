import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/meal-category',
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => selectMeal(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 20,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            '$title',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}
