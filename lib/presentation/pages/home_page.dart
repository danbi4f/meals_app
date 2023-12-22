import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/datasources/local/local_datasource.dart';
import 'package:meals_app/data/repositories/category_repository.dart';
import 'package:meals_app/data/repositories/meal_repository.dart';
import 'package:meals_app/presentation/bloc/category_bloc.dart';
import 'package:meals_app/presentation/bloc/meal_bloc.dart';
import 'package:meals_app/presentation/pages/categories_screen.dart';
import 'package:meals_app/presentation/widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPageIndex = 0;
    void selectPage(int index){
      selectedPageIndex = index;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active page title'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'categories'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites'
          ),
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
            BlocProvider(
              create: (context) => CategoryBloc(
                categoryRepository: context.read<CategoryRepository>(),
              ),
            ),
          ],
          child: const CategoriesScreen(),
        ),
      ),
    );
  }
}
