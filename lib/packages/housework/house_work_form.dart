import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:house_work/packages/housework/housework_data.dart';
import 'package:house_work/models/index.dart';
import 'package:house_work/utils/validators.util.dart';
import 'package:provider/provider.dart';

class HouseWorkForm extends StatefulWidget {
  const HouseWorkForm({super.key, this.isEdit = false, this.data});

  final bool isEdit;

  final HouseWork? data;

  @override
  State<HouseWorkForm> createState() => _HouseWorkFormState();
}

class _HouseWorkFormState extends State<HouseWorkForm> {
  /* ---- 表单 ---- */
  // 代办名
  final TextEditingController _nameInputControl = TextEditingController();
  // 任务
  final TextEditingController _worthInputControl = TextEditingController();

  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.data != null) {
      _nameInputControl.value = TextEditingValue(text: widget.data!.name);
      _worthInputControl.value =
          TextEditingValue(text: widget.data!.worth.toString());
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
            Text(widget.isEdit ? "编辑家务" : "新增家务"),
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
                          helperText: "(必填) 家务名称"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请输入名称"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _worthInputControl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                          label: Text("价格"),
                          hintText: "请输入价格",
                          border: OutlineInputBorder(),
                          helperText: "(必填) 价格"),
                      validator: (value) =>
                          validatorUtilnotEmpty(value, "请输入价格"),
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
      HouseWork houseWork = HouseWorkData.generateData(widget.data)
        ..worth = int.parse(_worthInputControl.text)
        ..name = _nameInputControl.text;

      if (widget.isEdit) {
        Provider.of<HouseWorkData>(context, listen: false).update(houseWork);
      } else {
        Provider.of<HouseWorkData>(context, listen: false).add(houseWork);
      }

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("保存成功"), duration: Duration(milliseconds: 300)));
      _closeDialog();
    }
  }
}

Future openHouseWorkFromDialog(BuildContext context,
    [HouseWork? data, bool isEdit = false]) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          child: HouseWorkForm(data: data, isEdit: isEdit),
        );
      });
}
