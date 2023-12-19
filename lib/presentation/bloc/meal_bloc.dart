import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meals_app/data/datasources/local/local_datasource.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<MealEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
