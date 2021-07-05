import 'package:flutter/material.dart';

import 'Filters.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: Center(
              child: Text(
                'Your Grub hub',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red[900],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Meals'),
            onTap: () => Navigator.of(context).pushNamed('/'),
          ),
          ListTile(
            title: const Text('Filters'),
            onTap: () => Navigator.of(context).pushNamed(Filters.routName),
          ),
        ],
      ),
    );
  }
}
