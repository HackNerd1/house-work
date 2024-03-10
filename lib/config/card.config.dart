class HwCardActionItem {
  HwCardActionItem({required this.key, required this.label});

  final String key;

  final String label;
}

class HwCardActions {
  static HwCardActionItem delete = HwCardActionItem(key: "delete", label: "删除");
  static HwCardActionItem compelete =
      HwCardActionItem(key: "compelete", label: "完成");
  static HwCardActionItem edit = HwCardActionItem(key: "edit", label: "编辑");
}
