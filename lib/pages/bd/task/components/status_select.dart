import 'package:flutter/material.dart';
import 'package:study/common/data/index.dart';
import 'package:study/components/custom_alert.dart';

class StatusSelect extends StatefulWidget {
  final int status;
  final bool edit;
  const StatusSelect({
    super.key,
    this.status = 1,
    this.edit = true,
  }); // 1 电话拜访 2 上门拜访

  @override
  State<StatusSelect> createState() => _StatusSelectState();
}

class _StatusSelectState extends State<StatusSelect> {
  int _status = 1;

  @override
  void initState() {
    super.initState();
    setState(() {
      _status = widget.status;
    });
  }

  void handleSelect(BuildContext context) async {
    if (!widget.edit) return;
    final res = await selectItem(
      title: '选择拜访方式',
      desc: '任务开始执行后拜访方式不可修改',
      content: context,
      list: [
        SelectDialogItem(id: '1', name: '上门拜访'),
        SelectDialogItem(id: '2', name: '电话拜访'),
      ],
    );
    if (res != null) {
      print(res.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleSelect(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color(0xFFF7F8FA),
        ),
        child: Row(
          mainAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Text(
              _status == 1 ? '电话拜访' : '上门拜访',
              style: TextStyle(
                fontSize: 14,
                fontWeight: .w400,
                color: Color(0xFF1D2129),
              ),
            ),
            if (widget.edit) ...[
              const SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}
