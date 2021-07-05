import 'package:flutter/material.dart';
import '../Widgets/CategoryItem.dart';
import '../Models/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrainsts) {
        return GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: constrainsts.maxWidth * 0.6,
            crossAxisSpacing: constrainsts.maxWidth * 0.05,
            mainAxisSpacing: constrainsts.maxHeight * 0.03,
            childAspectRatio: 1.5,
            mainAxisExtent: constrainsts.maxHeight * 0.165,
          ),
          padding: EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map((ctg) => CategoryItem(ctg.id, ctg.title, ctg.color))
              .toList(),
        );
      },
    );
  }
}
