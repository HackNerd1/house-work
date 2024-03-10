import 'package:flutter/material.dart';
import 'package:house_work/models/index.dart';
import 'package:house_work/packages/housework/housework_data.dart';
import 'package:house_work/packages/todo/todo_data.dart';
import 'package:house_work/utils/validators.util.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key, this.isEdit = false, this.data});

  final bool isEdit;

  final Todo? data;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  /* ---- 表单 ---- */
  // 代办名
  final TextEditingController _nameInputControl = TextEditingController();
  // 任务
  final TextEditingController _taskInputControl = TextEditingController();
  // 开始时间
  final TextEditingController _startTimeControl = TextEditingController();
  // 开始时间
  final TextEditingController _endTimeControl = TextEditingController();
  // 开始时间
  final TextEditingController _descriptionControl = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.data != null) {
      _nameInputControl.value = TextEditingValue(text: widget.data!.name);
      _taskInputControl.value =
          TextEditingValue(text: widget.data?.taskId ?? '');
      _startTimeControl.value =
          TextEditingValue(text: widget.data?.startTime ?? '');
      _endTimeControl.value =
          TextEditingValue(text: widget.data?.endTime ?? '');
      _descriptionControl.value =
          TextEditingValue(text: widget.data?.description ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<HouseWork> houseWorks =
        Provider.of<HouseWorkData>(context).houseWorks;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(onPressed: _closeDialog, icon: const Icon(Icons.close)),
            Text(widget.isEdit ? "编辑代办" : "新增代办"),
            TextButton(onPressed: _validateHandler, child: const Text("保存"))
          ]),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputControl,
                      decoration: const InputDecoration(
                          label: Text("名称"),
                          hintText: "请输入名称",
                          border: OutlineInputBorder(),
                          helperText: "(必填) 任务名称"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请输入名称"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: _taskInputControl,
                        textInputAction: TextInputAction.none,
                        enabled: houseWorks.isEmpty != true,
                        decoration: InputDecoration(
                            label: const Text("家务"),
                            border: const OutlineInputBorder(),
                            helperText:
                                houseWorks.isEmpty ? "请先添加家务" : "(可选) 家务"),
                        items: houseWorks
                            .map<Map<String, dynamic>>((houseWork) => ({
                                  'label': houseWork.name,
                                  'value': houseWork.id
                                }))
                            .toList()),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _descriptionControl,
                      maxLines: 6,
                      decoration: const InputDecoration(
                          label: Text("描述"),
                          hintText: "请输入描述",
                          border: OutlineInputBorder(),
                          helperText: "(可选) 任务描述"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _startTimeControl,
                      onTap: () {
                        _showTimePicker(context);
                      },
                      readOnly: true,
                      textInputAction: TextInputAction.none,
                      decoration: const InputDecoration(
                          label: Text("开始时间"),
                          hintText: "请选择开始时间",
                          border: OutlineInputBorder(),
                          helperText: "(必填) 开始时间"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请选择开始时间"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      readOnly: true,
                      // readOnly: true,
                      controller: _endTimeControl,
                      textInputAction: TextInputAction.none,
                      enabled: _startTimeControl.text.isEmpty != true,
                      onTap: () {
                        _showTimePicker(context, true);
                      },
                      decoration: const InputDecoration(
                          label: Text("结束时间"),
                          hintText: "请选择结束时间",
                          border: OutlineInputBorder(),
                          helperText: "(必填) 结束时间"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请选择结束时间"),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  // 关闭弹窗
  _closeDialog() {
    Navigator.of(context).pop();
  }

  _validateHandler() {
    if ((_formKey.currentState as FormState).validate()) {
      Todo todo = TodoData.generateData(widget.data)
        ..name = _nameInputControl.text
        ..startTime = _startTimeControl.text
        ..taskId = _taskInputControl.text
        ..endTime = _endTimeControl.text
        ..description = _descriptionControl.text;

      if (todo.taskId != null && todo.taskId != "") {
        todo.task = Provider.of<HouseWorkData>(context, listen: false)
            .find(todo.taskId!);
      }
      if (widget.isEdit) {
        Provider.of<TodoData>(context, listen: false).update(todo);
      } else {
        Provider.of<TodoData>(context, listen: false).add(todo);
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("保存成功"), duration: Duration(milliseconds: 300)));
      _closeDialog();
    }
  }

  _showTimePicker(BuildContext context, [bool isEnd = false]) async {
    final firstDate = isEnd
        ? DateTime.parse(_startTimeControl.text)
        : DateTime(DateTime.now().year - 10);
    final lastDate = isEnd
        ? DateTime(firstDate.year + 10)
        : DateTime(DateTime.now().year + 10);
    final date = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    if (date == null) return;
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time == null) return;

    setState(() {
      if (isEnd) {
        _endTimeControl.text = DateFormat('yyyy-MM-dd HH:mm')
            .format(date.copyWith(hour: time.hour, minute: time.minute));
      } else {
        _startTimeControl.text = DateFormat('yyyy-MM-dd HH:mm')
            .format(date.copyWith(hour: time.hour, minute: time.minute));
      }
    });
  }
}

Future openTodoFromDialog(BuildContext context,
    [Todo? data, bool isEdit = false]) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: TodoForm(data: data, isEdit: isEdit),
        );
      });
}
