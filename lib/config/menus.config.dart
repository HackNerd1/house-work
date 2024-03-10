import 'package:flutter/material.dart';
import 'package:house_work/routes/house_work.page.dart';
import 'package:house_work/routes/income.page.dart';
import 'package:house_work/routes/recipe.page.dart';
import 'package:house_work/routes/todo.page.dart';

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
      icon: Icons.assignment,
      build: () => const TodoPage());
  static MenuItem recipe = MenuItem(
      name: 'recipe',
      label: '菜谱',
      path: "recipe",
      icon: Icons.receipt,
      build: () => const RecipePage());
  static MenuItem houseWork = MenuItem(
      name: 'housework',
      label: '家务',
      path: "housework",
      icon: Icons.work,
      build: () => const HouseWorkPage());
  static MenuItem income = MenuItem(
      name: "income",
      label: '收入',
      path: "income",
      icon: Icons.money,
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
