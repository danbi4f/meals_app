import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/presentation/pages/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(children: [
        DrawerHeader(
          child: Row(
            children: [
              const Icon(Icons.food_bank, size: 60),
              const SizedBox(width: 20),
              Text(
                'cookbook!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FiltersScreen(),
              ),
            );
          },
          leading: const Icon(
            Icons.settings,
            size: 30,
          ),
          title: Text(
            'Settings',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
      ]),
    );
  }
}
