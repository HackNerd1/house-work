import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';
import 'package:house_work/routes/house_work.page.dart';
import 'package:house_work/routes/income.page.dart';
import 'package:house_work/routes/recipe.page.dart';
import 'package:house_work/routes/todo.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const TodoPage(),
      routes: {
        MenuConfig.houseWork.path: (context) => const HouseWorkPage(),
        MenuConfig.recipe.path: (context) => const RecipePage(),
        MenuConfig.income.path: (context) => const IncomePage()
      },
    );
  }
}
