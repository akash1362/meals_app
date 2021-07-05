import 'package:flutter/material.dart';
import 'package:meals_app/Models/FilterChecks.dart';

class Filters extends StatefulWidget {
  static const String routName = '/filters';
  final Function(FilterCheck) newFilters;
  final FilterCheck curFilters;
  Filters(this.curFilters, this.newFilters);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool glutenFree = false;
  bool vegan = false;
  bool vegetarian = false;
  bool lactoseFree = false;
  
  @override
  void initState() {
    glutenFree = widget.curFilters.isGlutenFree;
    vegan = widget.curFilters.isVegan;
    vegetarian = widget.curFilters.isVegetarian;
    lactoseFree = widget.curFilters.isLactoseFree;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.newFilters(FilterCheck(
              isGlutenFree: glutenFree,
              isLactoseFree: lactoseFree,
              isVegan: vegan,
              isVegetarian: vegetarian,
            )),
          )
        ],
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Gluton Free'),
            value: glutenFree,
            onChanged: (changed) {
              setState(() {
                glutenFree = changed;
              });
            },
          ),
          SwitchListTile(
            title: Text('Only vegan'),
            value: vegan,
            onChanged: (changed) {
              setState(() {
                vegan = changed;
              });
            },
          ),
          SwitchListTile(
            title: Text('Only vegetarian'),
            value: vegetarian,
            onChanged: (changed) {
              setState(() {
                vegetarian = changed;
              });
            },
          ),
          SwitchListTile(
            title: Text('Lactose Free'),
            value: lactoseFree,
            onChanged: (changed) {
              setState(() {
                lactoseFree = changed;
              });
            },
          ),
        ],
      ),
    );
  }
}
