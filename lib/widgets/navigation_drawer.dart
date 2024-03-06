import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

class HwNavigationDrawer extends StatelessWidget {
  const HwNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: MediaQuery.removePadding(
            context: context,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Expanded(child: _renderNavigationItem(context)),
              ],
            )));
  }

  Widget _renderNavigationItem(BuildContext context) {
    return ListView(
        children: menus
            .map((menu) => ListTile(
                  title: Text(menu.label),
                  leading: menu.icon,
                  onTap: () {
                    Navigator.of(context).pushNamed(menu.path);
                  },
                ))
            .toList());
  }
}
