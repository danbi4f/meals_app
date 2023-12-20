import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_app/data/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, MealCategoryState> {
  CategoryBloc({
    required this.categoryRepository,
  }) : super(
          MealCategoryState(categoryRepository: categoryRepository),
        ) {
    on<GetCategory>(
      (event, emit) {
        emit(state.categoryRepository.dataLocal.availableCategoriesList);
      },
    );
  }
  final CategoryRepository categoryRepository;
}
