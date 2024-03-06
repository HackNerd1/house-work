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
    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      children: menus
          .map((menu) => NavigationDrawerDestination(
                icon: Icon(menu.icon),
                label: Row(
                  children: [
                    Text(menu.label),
                    Text("${menu.label}2"),
                  ],
                ),
              ))
          .toList(),
      onDestinationSelected: (index) {
        Navigator.of(context).pushNamed(menus[index].path);
        setState(() {
          _selectedIndex = index;
        });
      },
    );

    // return Drawer(
    //     child: MediaQuery.removePadding(
    //         context: context,
    //         child: Column(
    //           children: [
    //             const SizedBox(
    //               height: 40,
    //             ),
    //             Expanded(child: _renderNavigationItem(context)),
    //           ],
    //         )));
  }
}
