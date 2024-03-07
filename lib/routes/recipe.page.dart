/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-07 23:03:51
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';
import 'package:house_work/widgets/navigation_drawer.dart';
import 'package:house_work/widgets/recipe_form.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("RecipePage"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openRecipeFromDialog(context);
          // openTodoFromDialog(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
