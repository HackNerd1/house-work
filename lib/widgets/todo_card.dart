/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 22:44:41
 * @LastEditors: Please set LastEditors
 * @LastEditTime: 2024-03-06 23:15:30
 */
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key, required this.title});

  final String title;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool _showDetail = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(254, 247, 255, 1),
      child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            width: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("title"),
                    // DropdownButton(
                    //   items: [DropdownMenuItem(child: Text("删除"))],
                    //   onChanged: (value) {},
                    // ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
                  ],
                ),
                Row(
                  children: [
                    Text("100"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text("title"),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("关闭"),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    FilledButton(onPressed: () {}, child: const Text("保存"))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
