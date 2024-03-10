/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:41:32
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-09 15:09:27
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';
import 'package:house_work/packages/housework/housework_data.dart';
import 'package:house_work/packages/income/income_data.dart';
import 'package:house_work/packages/recipe/recipe_data.dart';
import 'package:house_work/packages/todo/todo_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _menus = MenuConfig.renderMenu();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final HouseWorkData houseWorkData = Provider.of<HouseWorkData>(context);

    final navigationData = {
      MenuConfig.todo.name: Provider.of<TodoData>(context).length,
      MenuConfig.recipe.name: Provider.of<RecipeData>(context).length,
      MenuConfig.houseWork.name: Provider.of<HouseWorkData>(context).length,
      MenuConfig.income.name: Provider.of<IncomeData>(context).total,
    };

    String renderCount(MenuItem item) {
      return "${item.name == MenuConfig.income.name ? "￥" : " "}${navigationData[item.name].toString()}";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(MenuConfig.menus[_selectedIndex].label),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: const Text("Menu"),
          ),
          ...MenuConfig.menus.map((menu) => NavigationDrawerDestination(
              icon: Icon(menu.icon),
              label: Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Text(menu.label), Text(renderCount(menu))],
                  ),
                ),
              )))
        ],
        onDestinationSelected: (index) {
          Navigator.of(context).pop();
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        child: _menus[_selectedIndex],
      ),
    );
  }
}
