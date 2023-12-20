part of 'category_bloc.dart';

final class MealCategoryState extends Equatable {
  const MealCategoryState({required this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  List<Object> get props => [categoryRepository];

  MealCategoryState copyWith(
    CategoryRepository? categoryRepository,
  ) {
    return MealCategoryState(
      categoryRepository: categoryRepository ?? this.categoryRepository,
    );
  }
}
