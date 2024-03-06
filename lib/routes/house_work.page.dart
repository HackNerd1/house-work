import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

class HouseWorkPage extends StatelessWidget {
  const HouseWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MenuConfig.houseWork.label),
      ),
    );
  }
}
