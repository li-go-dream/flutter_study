import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study/common/dialog/index.dart';
import 'package:study/components/custom_alert.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/bd/task/components/task_item.dart';

class TaskDetail extends StatefulWidget {
  final String? id;
  const TaskDetail({ super.key, this.id });

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {

  String currentTime = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    getCurrentTime();
  }

  void getCurrentTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateFormat('HH:mm').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void handleOperation(BuildContext context) {
    customDialog(
      context,
      DialogPar(
          content: '确认到店打卡吗？',
          descWidget: Text.rich(
            WidgetSpan(
              child: Row(
                mainAxisAlignment: .center, 
                children: [
                  const SizedBox(height: 8),
                  Text('当前距离采购商', style: TextStyle(color: Color(0xFF666666))),
                  Text(' 40m', style: TextStyle(color: Color(0xFFF53F3F))),
                ]
              )
            ),
            style: TextStyle(fontSize: 16, fontWeight: .w400),
          ),
          cancelText: '取消',
          okText: '确认',
          okColor: 0xFF3D7EFF
      ), (cancelFn, val) {
        cancelFn(val);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomHeight =  MediaQuery.paddingOf(context).bottom;
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PageBar(title: '任务执行'),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TaskItem(type: 2),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                  padding: const EdgeInsets.symmetric(vertical: 87),
                  width: .maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          handleOperation(context);
                        },
                        child: Container(
                          width: 166,
                          height: 166,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(83),
                              border: Border.all(
                                  width: 10,
                                  color: Color(0xFF3D7EFF)
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: .center,
                            children: [
                              Text('到店打卡', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: .w500)),
                              Text('$currentTime', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: .w500)),
                              Text('偏移41m', style: TextStyle(color: Color(0xFF999999), fontSize: 16, fontWeight: .w400)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text('请到店打卡开始执行任务', style: TextStyle(color: Color(0xFF999999), fontSize: 14, fontWeight: .w400)),
                    ],
                  ),
                )
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomHeight),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    width: 0.5,
                    color: Color(0xFFDDDDDD)
                  )
                )
              ),
              child: GestureDetector(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFEEF3FF),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('填写日志', style: TextStyle(fontSize: 16, fontWeight: .w400, color: Color(0xFF3D7EFF)),),
                    ),
                  ),
                )
              ),
            )
          ],
        )
      ),
    );
  }}