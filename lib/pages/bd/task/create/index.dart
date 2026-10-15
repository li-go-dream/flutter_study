import 'package:flutter/material.dart';
import 'package:study/common/dialog/index.dart';
import 'package:study/components/custom_alert.dart';
import 'package:study/components/page_bar.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  void handleSubmit(BuildContext context) {
    customDialog(
      context,
      DialogPar(
        content: '确认创建任务吗？',
        cancelText: '取消',
        okText: '确认',
        okColor: 0xFF3D7EFF,
      ),
      (cancelFn, val) {
        cancelFn(val);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PageBar(title: '新建拜访任务'),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text.rich(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF666666),
                        ),
                        TextSpan(
                          children: [
                            TextSpan(text: '拜访采购商'),
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Color(0xFFF53F3F)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F3F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '请选择要拜访的采购商店铺',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w400,
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Color(0xFFBDBDBD),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text.rich(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF666666),
                        ),
                        TextSpan(
                          children: [
                            TextSpan(text: '任务日期'),
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Color(0xFFF53F3F)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2F3F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                // '请选择任务日期',
                                '2025-11-27',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w400,
                                  // color: Color(0xFF999999),
                                  color: Color(0xFF1D2129),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Color(0xFFBDBDBD),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text.rich(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF666666),
                        ),
                        TextSpan(
                          children: [
                            TextSpan(text: '拜访方式'),
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Color(0xFFF53F3F)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        spacing: 8,
                        children: [
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFE8F7FF),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  '上门拜访',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: .w400,
                                    color: Color(0xFF3491FA),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  '电话拜访',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: .w400,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomHeight),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(width: 0.5, color: Color(0xFFDDDDDD)),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  handleSubmit(context);
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF3D7EFF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '创建任务',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
