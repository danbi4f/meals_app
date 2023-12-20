part of 'meal_bloc.dart';



final class MealsState extends Equatable {
  const MealsState({required this.mealRepository});

  final MealRepository mealRepository;

  @override
  List<Object> get props => [mealRepository];

  MealsState copyWith(
    MealRepository? mealRepository,
  ) {
    return MealsState(
      mealRepository: mealRepository ?? this.mealRepository,
    );
  }
}


