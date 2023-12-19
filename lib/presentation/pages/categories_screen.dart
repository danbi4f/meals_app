import 'package:flutter/material.dart';
import 'package:meals_app/presentation/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        //for(in)
        CategoryGridItem(),
      ],
    );
  }
}
