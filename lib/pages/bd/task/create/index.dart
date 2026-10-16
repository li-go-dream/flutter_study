import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:study/common/dialog/index.dart';
import 'package:study/components/custom_alert.dart';
import 'package:study/components/page_bar.dart';
import 'package:flutter_datetime_picker_plus/src/datetime_picker_theme.dart'
    as picker_theme;

class TypeItem {
  final int id;
  final String name;

  TypeItem({required this.id, required this.name});
}

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late DateTime taskTime;
  int status = 2; //1 电话拜访 2 上门拜访

  final List<TypeItem> typeList = [
    TypeItem(id: 2, name: '上门拜访'),
    TypeItem(id: 1, name: '电话拜访'),
  ];

  @override
  void initState() {
    super.initState();
    taskTime = DateTime.now();
  }

  void chooseTime(BuildContext context) {
    final rootContext = Navigator.of(context, rootNavigator: true).context;
    final minTime = DateTime.now();
    DatePicker.showDatePicker(
      rootContext,
      minTime: minTime,
      currentTime: taskTime,
      onConfirm: (time) {
        setState(() {
          taskTime = time;
        });
      },
      theme: picker_theme.DatePickerTheme(
        cancelStyle: const TextStyle(color: Color(0xFF666666)),
        doneStyle: const TextStyle(color: Color(0xFF3D7EFF)),
        itemStyle: const TextStyle(
          fontSize: 16,
          fontWeight: .w500,
          color: Color.fromRGBO(0, 0, 0, 0.90),
        ),
      ),
      locale: LocaleType.zh,
    );
  }

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
    final timeText = DateFormat('yyyy-MM-dd').format(taskTime);
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
                      GestureDetector(
                        onTap: () => chooseTime(context),
                        child: Container(
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
                                  timeText,
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
                        children: typeList.map((item) {
                          return Flexible(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  status = item.id;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: status == item.id
                                      ? Color(0xFFE8F7FF)
                                      : Color(0xFFF2F3F5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: .w400,
                                      color: status == item.id
                                          ? Color(0xFF3491FA)
                                          : Color(0xFF666666),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
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
