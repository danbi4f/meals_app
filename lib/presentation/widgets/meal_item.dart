import 'package:flutter/material.dart';
import 'package:meals_app/domain/entities/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key, 
    required this.meal,
    
  
  });

  final Meal meal;
  
  @override
  Widget build(BuildContext context) {
        return Card(
      child: Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Column(
                children: [
                  Text(meal.title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
