/*
 * @Descripttion: 
 * @version: 0.0.1
 * @Author: Hansel
 * @Date: 2024-03-06 22:44:41
 * @LastEditors: Hansel
 * @LastEditTime: 2024-03-09 22:41:47
 */
import 'package:flutter/material.dart';
import 'package:house_work/config/card.config.dart';

class HwCardWiget extends StatefulWidget {
  const HwCardWiget(
      {super.key,
      required this.title,
      this.description = "",
      this.detail = "",
      this.disable = false,
      this.actions,
      this.onDelete,
      this.onEdit,
      this.onFinished,
      this.finished = false});

  final String title;

  final String description;

  final String detail;

  final List<HwCardActionItem>? actions;

  final Function? onDelete;

  final Function? onEdit;

  final Function? onFinished;

  final bool disable;

  final bool finished;

  @override
  State<HwCardWiget> createState() => _HwCardWigetState();
}

class _HwCardWigetState extends State<HwCardWiget> {
  // controler
  ExpansionTileController expansionTileController = ExpansionTileController();

  late TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    textStyle = TextStyle(
        decoration:
            widget.finished ? TextDecoration.lineThrough : TextDecoration.none);
  }

  // 控制展开收起
  void toggleExpand() {
    if (widget.disable) return;
    if (expansionTileController.isExpanded) {
      expansionTileController.collapse();
    } else {
      expansionTileController.expand();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 12),
        color: const Color.fromRGBO(254, 247, 255, 1),
        child: InkWell(
            onTap: toggleExpand,
            child: Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  controller: expansionTileController,
                  enabled: false,
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding:
                      const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  leading: ClipOval(
                      child: Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    color: const Color.fromRGBO(103, 80, 164, 1),
                    child: Text(
                      widget.title[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  )),
                  trailing: PopupMenuButton(
                    enabled: widget.actions?.isNotEmpty ?? false,
                    itemBuilder: (context) => widget.actions != null
                        ? widget.actions!
                            .map(
                              (action) => PopupMenuItem(
                                value: action.key,
                                child: Text(action.label),
                              ),
                            )
                            .toList()
                        : [],
                    onSelected: (value) {
                      if (value == HwCardActions.edit.key) {
                        if (widget.onEdit != null) {
                          widget.onEdit!();
                        }
                      } else if (value == HwCardActions.delete.key) {
                        if (widget.onDelete != null) {
                          widget.onDelete!();
                        }
                      } else if (value == HwCardActions.compelete.key) {
                        if (widget.onFinished != null) {
                          widget.onFinished!();
                        }
                      }
                    },
                  ),
                  title: Text(widget.title,
                      style: textStyle.copyWith(
                          color: const Color.fromARGB(255, 1, 1, 1),
                          fontSize: 16)),
                  subtitle: widget.description.isNotEmpty
                      ? Text(
                          widget.description,
                          style: textStyle.copyWith(
                              color: const Color.fromARGB(200, 73, 69, 79)),
                        )
                      : null,
                  children: [Text(widget.detail, style: textStyle)],
                ))));
  }
}
