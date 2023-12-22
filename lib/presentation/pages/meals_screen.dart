import 'package:flutter/material.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:meals_app/presentation/pages/meal_details_screen.dart';
import 'package:meals_app/presentation/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (meal){
                selectMeal(context, meal);
              },
            )),
      ),
    );
  }
}
    // Widget content = Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Text(
    //         'Uh oh ... nothing here!',
    //         style: Theme.of(context).textTheme.headlineLarge!.copyWith(
    //               color: Theme.of(context).colorScheme.onBackground,
    //             ),
    //       ),
    //       const SizedBox(height: 16),
    //       Text(
    //         'Try selecting a different category!',
    //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //               color: Theme.of(context).colorScheme.onBackground,
    //             ),
    //       ),
    //     ],
    //   ),
    // );

//     if (meals.isNotEmpty) {
//       ListView.builder(
//         itemCount: meals.length,
//         itemBuilder: ((context, index) => MealItem(
//               meal: meals[index],
//             )),
//       );
//     }
//     // if (title == null) {
//     //   return content;
//     // }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title!),
//       ),
//     );
//   }
// }
