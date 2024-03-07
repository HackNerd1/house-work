import 'package:flutter/material.dart';
import 'package:house_work/widgets/todo_card.dart';
import 'package:house_work/widgets/todo_form.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TodoCard(
            title: "拖地",
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openTodoFromDialog(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      // bottomSheet: BottomSheet(
      //   showDragHandle: true,
      //   builder: (context) => TodoForm(),
      //   onClosing: () {},
      // ),
    );
  }
}
