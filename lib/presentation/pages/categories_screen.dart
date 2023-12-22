import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/domain/entities/category.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/presentation/bloc/category_bloc.dart';
import 'package:meals_app/presentation/bloc/meal_bloc.dart';
import 'package:meals_app/presentation/pages/meals_screen.dart';
import 'package:meals_app/presentation/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Meal> getMeal() => BlocProvider.of<MealBloc>(context)
      .mealRepository
      .dataLocal
      .dummyMealsList;

  selectCategory(BuildContext context, Category category) {
    final mealsList = getMeal();
    final filtredMeals = mealsList.where(
      (meal) => meal.categories.contains(category.id),
    ).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          meals: filtredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, MealCategoryState>(
      builder: (context, state) {
        return GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category
                in state.categoryRepository.dataLocal.availableCategoriesList)
              CategoryGridItem(category: category, onSelectCategory: (){
                selectCategory(context, category);
              }),
          ],
        );
      },
    );
  }
}
