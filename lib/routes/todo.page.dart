/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-07 22:33:43
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-10 11:58:16
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:house_work/config/card.config.dart';
import 'package:house_work/models/index.dart';
import 'package:house_work/packages/income/income_data.dart';
import 'package:house_work/packages/todo/todo_data.dart';
import 'package:house_work/packages/todo/todo_form.dart';
import 'package:house_work/widgets/empty.dart';
import 'package:house_work/widgets/hw_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late double progress = .0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: Duration(microseconds: 1000),
    );
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void startAnimate(TodoData todo) {
    if (progress != todo.progress) {
      progress = todo.progress;
      _animationController.animateTo(todo.progress);
    }
  }

  @override
  Widget build(BuildContext context) {
    TodoData todoModel = Provider.of<TodoData>(context);
    startAnimate(todoModel);
    return Scaffold(
      body: todoModel.todos.isNotEmpty || todoModel.finishedList.isNotEmpty
          ? ListView(children: [
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: LinearProgressIndicator(
                  value: _animationController.value,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                ),
              ),
              ...renderTodos(),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: const Divider(height: 1.0)),
              ...renderFnished()
            ])
          : const EmptyWiget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openTodoFromDialog(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  renderTodos() {
    TodoData todoModel = Provider.of<TodoData>(context);
    IncomeData incomeData = Provider.of<IncomeData>(context);
    return todoModel.todos.map((todo) => HwCardWiget(
          title: todo.name,
          description: renderRemainDate(todo.endTime),
          detail: renderDetail(todo),
          actions: [
            HwCardActions.compelete,
            HwCardActions.edit,
            HwCardActions.delete,
          ],
          onDelete: () {
            todoModel.delete(todo);
          },
          onEdit: () {
            openTodoFromDialog(context, todo, true);
          },
          onFinished: () {
            todoModel.finish(todo);
            incomeData.updateIncome(todo);
          },
        ));
  }

  String renderRemainDate(String? endTime) {
    if (endTime == null) return "";
    var end = DateTime.parse(endTime);
    var now = DateTime.now();
    var remain = end.difference(now);
    var remainDay = remain.inDays.abs();
    var remainHours = remain.inHours.abs() % 24;

    return "${remain.isNegative ? "超时" : "剩余"} ${remainDay == 0 ? "" : "${remainDay}天 "}${remainDay == 0 && remainHours == 0 ? "" : "${remainHours}分钟 "}${remain.inMinutes % 60} 分钟";
  }

  String renderTime(String? startTime, String? endTime) {
    return "$startTime - $endTime";
  }

  String renderDetail(Todo todo) {
    var result = "";
    if (todo.description != null && todo.description != "") {
      result += "描述:\n${todo.description}\n";
    }
    if (todo.task != null) {
      result += "家务:\n${todo.task!.name}\n价值:\n￥${todo.task!.worth}\n";
    }
    result += "时间:\n${renderTime(todo.startTime, todo.endTime)}\n";
    return result;
  }

  renderFnished() {
    TodoData todoModel = Provider.of<TodoData>(context);
    return todoModel.finishedList.map((todo) => HwCardWiget(
        title: todo.name,
        description: "完成时间: ${todo.finishTime}",
        detail: renderDetail(todo),
        finished: true));
  }
}
