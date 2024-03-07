/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-06 22:09:45
 */
import 'package:flutter/material.dart';
import 'package:house_work/widgets/house_work_form.dart';

class HouseWorkPage extends StatelessWidget {
  const HouseWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HouseWorkPage"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openHouseWorkFromDialog(context);
          // openTodoFromDialog(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
