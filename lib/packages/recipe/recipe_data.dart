/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-08 19:46:34
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-09 22:11:15
 */
import 'package:house_work/Global/global_data.notifier.dart';
import 'package:house_work/models/index.dart';
import 'package:uuid/uuid.dart';

class RecipeData extends GloabalDataNotifier {
  static Recipe generateData(Recipe? houseWork) {
    if (houseWork != null) {
      return houseWork;
    } else {
      return Recipe()
        ..id = const Uuid().v8()
        ..deleted = false;
    }
  }

  List<Recipe> get recipes {
    return userData.recipes.where((recipe) => recipe.deleted == false).toList();
  }

  set recipes(List<Recipe> recipe) {
    userData.recipes = recipe;
    notifyListeners();
  }

  get length {
    return recipes.length ?? 0;
  }

  void add(Recipe recipe) {
    userData.recipes.add(recipe);
    notifyListeners();
  }

  void delete(Recipe recipe) {
    final index = findIndex(recipe);
    if (index != -1) {
      userData.recipes[index].deleted = true;
    }
    notifyListeners();
  }

  void update(Recipe recipe) {
    final index = findIndex(recipe);
    if (index != -1) {
      userData.recipes[index] = recipe;
      notifyListeners();
    }
  }

  int findIndex(Recipe recipe) {
    return userData.recipes.indexWhere((element) {
      return element.id == recipe.id;
    });
  }
}
