import 'package:flutter/material.dart';
import 'package:house_work/models/todo.dart';
import 'package:house_work/utils/validators.util.dart';
import 'package:select_form_field/select_form_field.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key, this.isEdit = false, this.data});

  final bool isEdit;

  final Todo? data;

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  /* ---- 表单 ---- */
  // 代办名
  final TextEditingController _nameInputControl = TextEditingController();
  // 任务
  final TextEditingController _taskInputControl = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.data != null) {
      _nameInputControl.value = widget.data!.name as TextEditingValue;
      // form = widget.data!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(onPressed: _closeDialog, icon: const Icon(Icons.close)),
            Text(widget.isEdit ? "编辑菜谱" : "新增菜谱"),
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
                          helperText: "帮助"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请输入名称"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SelectFormField(
                        type: SelectFormFieldType.dropdown,
                        controller: _taskInputControl,
                        decoration: const InputDecoration(
                            label: Text("任务"),
                            border: OutlineInputBorder(),
                            helperText: "帮助"),
                        items: const [
                          {
                            'value': 'boxValue',
                            'label': 'Box Label',
                            'icon': Icon(Icons.stop),
                          },
                          {
                            'value': 'circleValue',
                            'label': 'Circle Label',
                            'icon': Icon(Icons.fiber_manual_record),
                            'textStyle': TextStyle(color: Colors.red),
                          },
                          {
                            'value': 'starValue',
                            'label': 'Star Label',
                            'enable': false,
                            'icon': Icon(Icons.grade),
                          },
                        ])
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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("保存成功"), duration: Duration(milliseconds: 300)));
      _closeDialog();
    }
  }
}

Future openRecipeFromDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: RecipeForm(),
        );
      });
}
