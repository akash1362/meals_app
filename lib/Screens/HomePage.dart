import 'package:flutter/material.dart';
import 'package:meals_app/Models/meals.dart';
import '../Screens/Categories_Screen.dart';
import '../Screens/FavoritesScreen.dart';

import 'Drawer.dart';

class HomePage extends StatefulWidget {
  final List<Meal> favorites;
  HomePage(this.favorites);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> _body;
  int _selected = 0;
  @override
  void initState() {
    _body = [
      CategoriesScreen(),
      FavoritesScreen(widget.favorites),
    ];
    super.initState();
  }

  void _ontap(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: _body.elementAt(_selected),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selected,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _ontap,
      ),
    );
  }
}
