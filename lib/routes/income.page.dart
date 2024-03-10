/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 12:17:11
 */
import 'package:flutter/material.dart';
import 'package:house_work/packages/income/income_data.dart';
import 'package:house_work/widgets/icon_font.dart';
import 'package:provider/provider.dart';

class IncomePage extends StatelessWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeData = Provider.of<IncomeData>(context).incomeData;
    return Scaffold(
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now(),
            onDateChanged: (value) {},
          ),
          SizedBox(height: 20),
          Icon(
            IconFont.icon_income_one,
            size: 40.0,
          ),
          SizedBox(height: 10),
          Text(
            "总收入 ￥${incomeData.total}",
          )
        ],
      ),
    );
  }
}
