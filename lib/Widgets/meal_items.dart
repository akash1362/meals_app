import 'package:flutter/material.dart';
import '../Screens/thisMeal.dart';
import '../Models/meals.dart';

class MealItem extends StatelessWidget {
  final Meal item;
  final Function(String) removeitem;
  MealItem(this.item, this.removeitem);
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ThisMeal.routeName, arguments: {
      'Meal': item,
    }).then((value) {
      if (value != null) {
        removeitem(value.toString());
      }
    });
  }

  String get complexity {
    if (item.complexity == Complexity.Simple)
      return 'Simple';
    else if (item.complexity == Complexity.Challenging)
      return 'Challenging';
    else
      return 'Hard';
  }

  String get affordability {
    if (item.affordability == Affordability.Affordable)
      return 'Affordable';
    else if (item.affordability == Affordability.Luxurious)
      return 'Luxurious';
    else
      return 'Pricey';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    item.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: 300,
                    child: Text(
                      item.title,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('${item.duration}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexity),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordability),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
