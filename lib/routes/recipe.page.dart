import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MenuConfig.recipe.label),
      ),
    );
  }
}
