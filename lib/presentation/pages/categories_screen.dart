import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/presentation/bloc/category_bloc.dart';
import 'package:meals_app/presentation/bloc/meal_bloc.dart';
import 'package:meals_app/presentation/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, MealCategoryState>(
      builder: (context, state) {
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            for(final category in state.categoryRepository.dataLocal.availableCategoriesList)
            CategoryGridItem(category: category),
          ],
        );
      },
    );
  }
}
