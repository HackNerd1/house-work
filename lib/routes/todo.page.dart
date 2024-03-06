import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MenuConfig.todo.label)),
    );
  }
}
