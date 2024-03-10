/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 21:05:39
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-09 21:42:22
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/card.config.dart';
import 'package:house_work/packages/housework/housework_data.dart';
import 'package:house_work/packages/housework/house_work_form.dart';
import 'package:house_work/widgets/empty.dart';
import 'package:house_work/widgets/hw_card.dart';
import 'package:provider/provider.dart';

class HouseWorkPage extends StatelessWidget {
  const HouseWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final houseModel = Provider.of<HouseWorkData>(context);
    return Scaffold(
      body: houseModel.houseWorks.isEmpty
          ? EmptyWiget()
          : ListView(
              children: houseModel.houseWorks
                  .map((houseWork) => HwCardWiget(
                      title: houseWork.name,
                      detail: "价值 ${HouseWorkData.getPrice(houseWork)}",
                      actions: [
                        HwCardActions.edit,
                        HwCardActions.delete,
                      ],
                      onDelete: () {
                        Provider.of<HouseWorkData>(context, listen: false)
                            .delete(houseWork);
                      },
                      onEdit: () {
                        openHouseWorkFromDialog(context, houseWork, true);
                      }))
                  .toList(),
            ),
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
