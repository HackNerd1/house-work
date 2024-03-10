/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-09 22:06:24
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/card.config.dart';
import 'package:house_work/packages/recipe/recipe_data.dart';
import 'package:house_work/widgets/empty.dart';
import 'package:house_work/packages/recipe/recipe_form.dart';
import 'package:house_work/widgets/hw_card.dart';
import 'package:provider/provider.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final houseModel = Provider.of<RecipeData>(context);
    return Scaffold(
      body: houseModel.recipes.isEmpty
          ? const EmptyWiget()
          : ListView(
              children: houseModel.recipes
                  .map((recipe) => HwCardWiget(
                      title: recipe.name,
                      detail: "做法:\n${recipe.steps}",
                      actions: [
                        HwCardActions.edit,
                        HwCardActions.delete,
                      ],
                      onDelete: () {
                        Provider.of<RecipeData>(context, listen: false)
                            .delete(recipe);
                      },
                      onEdit: () {
                        openRecipeFromDialog(context, recipe, true);
                      }))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openRecipeFromDialog(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
