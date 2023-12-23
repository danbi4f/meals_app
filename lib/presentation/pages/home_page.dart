import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/datasources/local/local_datasource.dart';
import 'package:meals_app/data/repositories/category_repository.dart';
import 'package:meals_app/data/repositories/meal_repository.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/presentation/bloc/category_bloc.dart';
import 'package:meals_app/presentation/bloc/meal_bloc.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // List favoriteMealsList = [];

    // List<Meal> getMeal() => BlocProvider.of<MealBloc>(context)
    //     .mealRepository
    //     .dataLocal
    //     .dummyMealsList;
    // final mealsList = getMeal();

    // bool toggleMealFavoriteStatus(Meal meal) {
    //   final mealsIsFavorite = mealsList.contains(meal);
    //   if (mealsIsFavorite) {
    //     final favoriteslist = mealsList.where((m) => m.id != meal.id).toList();
    //     return false;
    //   } else {
    //     final favoriteslist = [...favoriteMealsList, meal];
    //     return true;
    //   }
    // }

    int selectedPageIndex = 0;
    void selectPage(int index) {
      selectedPageIndex = index;
    }

    Widget navigationBar = CategoriesScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Active page title'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      drawer: const MainDrawer(),
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => MealRepository(
              dataLocal: LocalDataSource(),
            ),
          ),
          RepositoryProvider(
            create: (context) => CategoryRepository(
              dataLocal: LocalDataSource(),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<MealBloc>(
              create: (context) => MealBloc(
                mealRepository: context.read<MealRepository>(),
              ),
            ),
            BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(
                categoryRepository: context.read<CategoryRepository>(),
              ),
            ),
          ],
          child:  CategoriesScreen(),
        ),
      ),
    );
  }
}
