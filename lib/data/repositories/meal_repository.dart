import 'package:meals_app/data/datasources/local/local_datasource.dart';

class MealRepository{
MealRepository({required this.dataLocal});
  final LocalDataSource dataLocal;


  getMeal() => dataLocal.dummyMealsList;
}