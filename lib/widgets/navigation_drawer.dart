/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-09 15:03:34
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

class HwNavigationDrawer extends StatefulWidget {
  const HwNavigationDrawer({super.key});

  @override
  State<HwNavigationDrawer> createState() => _HwNavigationDrawerState();
}

class _HwNavigationDrawerState extends State<HwNavigationDrawer> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(16.0),
      ),
      NavigationDrawer(
        selectedIndex: _selectedIndex,
        children: MenuConfig.menus
            .map((menu) => NavigationDrawerDestination(
                  icon: Icon(menu.icon),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(menu.label),
                      Text("${menu.name}"),
                    ],
                  ),
                ))
            .toList(),
        onDestinationSelected: (index) {
          Navigator.of(context).pushNamed(MenuConfig.menus[index].path);
          setState(() {
            _selectedIndex = index;
          });
        },
      )
    ]);
  }
}
