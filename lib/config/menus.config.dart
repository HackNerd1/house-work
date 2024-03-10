/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 12:26:08
 */
import 'package:flutter/material.dart';
import 'package:house_work/routes/house_work.page.dart';
import 'package:house_work/routes/income.page.dart';
import 'package:house_work/routes/recipe.page.dart';
import 'package:house_work/routes/todo.page.dart';
import 'package:house_work/widgets/icon_font.dart';

class MenuItem {
  MenuItem(
      {required this.label,
      this.icon,
      required this.path,
      this.build,
      required this.name});

  String label;
  String path;
  String name;
  IconData? icon;
  Widget Function()? build;
}

class MenuConfig {
  static MenuItem todo = MenuItem(
      name: 'todo',
      label: '代办',
      path: "/",
      icon: IconFont.icon_1_todo,
      build: () => const TodoPage());
  static MenuItem recipe = MenuItem(
      name: 'recipe',
      label: '菜谱',
      path: "recipe",
      icon: IconFont.icon_repast_recipe,
      build: () => const RecipePage());
  static MenuItem houseWork = MenuItem(
      name: 'housework',
      label: '家务',
      path: "housework",
      icon: Icons.work_outline,
      build: () => const HouseWorkPage());
  static MenuItem income = MenuItem(
      name: "income",
      label: '收入',
      path: "income",
      icon: IconFont.icon_1_income_2,
      build: () => const IncomePage());

  static List<MenuItem> menus = [
    MenuConfig.todo,
    MenuConfig.recipe,
    MenuConfig.houseWork,
    MenuConfig.income
  ];

  static renderMenu() {
    return menus.map((menu) => menu.build!()).toList();
  }
}
