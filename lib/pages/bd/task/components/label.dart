import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final int status;
  const Label({super.key, this.status = 1}); // 1 待执行 2 执行中 已完成

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: status == 1
            ? Color(0xFFEEF3FF)
            : status == 2
            ? Color(0xFFFFF7E8)
            : Color(0xFFE8FFEA),
      ),
      child: Text(
        status == 1
            ? '待执行'
            : status == 2
            ? '执行中'
            : '已完成',
        style: TextStyle(
          fontSize: 12,
          fontWeight: .w400,
          color: status == 1
              ? Color(0xFF3D7EFF)
              : status == 2
              ? Color(0xFFFF7D00)
              : Color(0xFF00B42A),
        ),
      ),
    );
  }
}
