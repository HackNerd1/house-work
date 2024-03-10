import 'package:flutter/material.dart';
import 'package:house_work/widgets/icon_font.dart';

class EmptyWiget extends StatelessWidget {
  const EmptyWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconFont.icon_kongshuju,
            size: 60.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text("暂无数据")
        ],
      ),
    );
  }
}
