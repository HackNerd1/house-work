import 'package:flutter/material.dart';
import 'package:house_work/config/menus.config.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(MenuConfig.income.label),
    ));
  }
}
