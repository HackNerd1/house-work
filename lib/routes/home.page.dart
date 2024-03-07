/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:41:32
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2024-03-06 23:19:43
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(MenuConfig.menus[_selectedIndex].label),
      ),
      drawer: NavigationDrawer(
        selectedIndex: _selectedIndex,
        children: MenuConfig.menus
            .map((menu) => NavigationDrawerDestination(
                  icon: Icon(menu.icon),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(menu.label),
                      Text("${menu.label}2"),
                    ],
                  ),
                ))
            .toList(),
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
