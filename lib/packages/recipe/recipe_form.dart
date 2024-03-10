import 'package:flutter/material.dart';
import 'package:house_work/models/index.dart';
import 'package:house_work/packages/recipe/recipe_data.dart';
import 'package:house_work/utils/validators.util.dart';
import 'package:provider/provider.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({super.key, this.isEdit = false, this.data});

  final bool isEdit;

  final Recipe? data;

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  /* ---- 表单 ---- */
  // 代办名
  final TextEditingController _nameInputControl = TextEditingController();
  // 任务
  final TextEditingController _stepInputControl = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.data != null) {
      _nameInputControl.value = TextEditingValue(text: widget.data!.name);
      _stepInputControl.value = TextEditingValue(text: widget.data!.steps);
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
                          helperText: "(必填) 菜品名称"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请输入名称"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _stepInputControl,
                      maxLines: 6,
                      decoration: const InputDecoration(
                          label: Text("做法"),
                          hintText: "请输入做法",
                          border: OutlineInputBorder(),
                          helperText: "(必填) 菜品做法"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请输入做法"),
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
      Recipe recipe = RecipeData.generateData(widget.data)
        ..name = _nameInputControl.text
        ..steps = _stepInputControl.text;

      if (widget.isEdit) {
        Provider.of<RecipeData>(context, listen: false).update(recipe);
      } else {
        Provider.of<RecipeData>(context, listen: false).add(recipe);
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("保存成功"), duration: Duration(milliseconds: 300)));
      _closeDialog();
    }
  }
}

Future openRecipeFromDialog(BuildContext context,
    [Recipe? data, bool isEdit = false]) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: RecipeForm(
            data: data,
            isEdit: isEdit,
          ),
        );
      });
}
