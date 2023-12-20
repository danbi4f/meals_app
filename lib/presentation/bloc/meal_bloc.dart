import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_app/data/repositories/meal_repository.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealsState> {
  MealBloc({
    required this.mealRepository,
  }) : super(MealsState(mealRepository: mealRepository)) {
    on<GetMeals>(
      (event, emit) {
        emit(state.mealRepository.dataLocal.dummyMealsList);
      },
    );
  }
  final MealRepository mealRepository;
}
