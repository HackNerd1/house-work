import 'package:flutter/material.dart';

class MenuItem {
  MenuItem({required this.label, this.icon, required this.path});

  String label;
  String path;
  IconData? icon;
  Widget? widget;
}

class MenuConfig {
  static MenuItem todo =
      MenuItem(label: '代办', path: "/", icon: Icons.assignment);
  static MenuItem recipe =
      MenuItem(label: '菜谱', path: "recipe", icon: Icons.receipt);
  static MenuItem houseWork =
      MenuItem(label: '家务', path: "housework", icon: Icons.work);
  static MenuItem income =
      MenuItem(label: '收入', path: "income", icon: Icons.money);
}

List<MenuItem> menus = [
  MenuConfig.todo,
  MenuConfig.recipe,
  MenuConfig.houseWork,
  MenuConfig.income
];
