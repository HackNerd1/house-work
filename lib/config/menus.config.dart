import 'package:flutter/material.dart';

class MenuItem {
  MenuItem({required this.label, this.icon, required this.path});

  String label;
  String path;
  Icon? icon;
  Widget? widget;
}

class MenuConfig {
  static MenuItem todo =
      MenuItem(label: '代办', path: "/", icon: const Icon(Icons.assignment));
  static MenuItem recipe =
      MenuItem(label: '菜谱', path: "recipe", icon: const Icon(Icons.receipt));
  static MenuItem houseWork =
      MenuItem(label: '家务', path: "housework", icon: const Icon(Icons.work));
  static MenuItem income =
      MenuItem(label: '收入', path: "income", icon: const Icon(Icons.money));
}

List<MenuItem> menus = [
  MenuConfig.todo,
  MenuConfig.recipe,
  MenuConfig.houseWork,
  MenuConfig.income
];
