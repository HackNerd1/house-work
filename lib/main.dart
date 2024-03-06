/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-06 21:42:40
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';
import 'package:house_work/routes/home.page.dart';
import 'package:house_work/routes/house_work.page.dart';
import 'package:house_work/routes/income.page.dart';
import 'package:house_work/routes/recipe.page.dart';
import 'package:house_work/routes/todo.page.dart';
import 'package:house_work/widgets/navigation_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        MenuConfig.houseWork.path: (context) => const HouseWorkPage(),
        MenuConfig.recipe.path: (context) => const RecipePage(),
        MenuConfig.income.path: (context) => const IncomePage()
      },
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       // home: const TodoPage(),
//       routes: {
//         MenuConfig.houseWork.path: (context) => const HouseWorkPage(),
//         MenuConfig.recipe.path: (context) => const RecipePage(),
//         MenuConfig.income.path: (context) => const IncomePage()
//       },
//       builder: (context, child) {
//         return Scaffold();
//       },
//     );
//   }
// }
