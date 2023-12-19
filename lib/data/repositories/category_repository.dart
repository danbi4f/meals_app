import 'package:meals_app/data/datasources/local/local_datasource.dart';

class CategoryRepository{
CategoryRepository({required this.dataLocal});
  final LocalDataSource dataLocal;


  getCategory() => dataLocal.availableCategoriesList;
}