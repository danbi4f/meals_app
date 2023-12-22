import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column( children: [
        SwitchListTile(value: true, onChanged: (bool)=> true),
        SwitchListTile(value: true, onChanged: (bool)=> true),
        SwitchListTile(value: true, onChanged: (bool)=> true),
        SwitchListTile(value: true, onChanged: (bool)=> true),
      ]),
    );
  }
}
