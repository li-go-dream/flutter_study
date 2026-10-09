import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  int detailType = 1; // 1 电话拜访 2 上门拜访
  int clockIn = 1; // 1 未打卡 2 已经打卡 3 结束打卡

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
    String content = '确认到店打卡吗';
    Widget? descWidget;
    String okText = '确认';
    if (detailType == 1) { // 电话拜访
      if (clockIn == 1) {// 未打卡
        content = '是否拨打电话联系客户电话';
        descWidget = Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text('18848889899', style: TextStyle(fontSize: 16, fontWeight: .w400),),
        );
        okText = '立即拨打';
      } else if (clockIn == 2) {
        content = '确认结束任务吗？';
      }
    } else if (detailType == 2) {
      if (clockIn == 1 || clockIn == 2) {// 未打卡
        descWidget = Text.rich(
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
        );
        content = clockIn == 1 ? '确认到店打卡吗' : '确认离店打卡吗？';
      }
    }
    customDialog(
      context,
      DialogPar(
          content: content,
          descWidget: descWidget,
          cancelText: '取消',
          okText: okText,
          okColor: 0xFF3D7EFF
      ), (cancelFn, val) {
        if (val) {
          setState(() {
            clockIn ++;
          });
        }
        cancelFn(val);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomHeight =  MediaQuery.paddingOf(context).bottom;
    const List arr = [1,2];
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
                  padding: clockIn == 1 ? const EdgeInsets.symmetric(vertical: 87) : const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  width: .maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    crossAxisAlignment: clockIn == 3 ? .start : .center,
                    children: [
                      if (clockIn != 1)
                        ...[
                          ...arr.indexed.map((record) {
                            final (index, item) = record;
                            return Column(
                              crossAxisAlignment: .start,
                              children: [
                                Row(
                                  spacing: 8,
                                  children: [
                                    Image.asset('assets/images/process.png', width: 16, height: 16),
                                    Text('开始任务', style: TextStyle(fontSize: 16, fontWeight: .w600, color: Color(0xFF1D2129))),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(16, 2, 0, 32),
                                  margin: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          left: BorderSide(
                                              width: 2,
                                              color: index < (arr.length - 1) ? Color(0xFF3D7EFF) : Colors.white
                                          )
                                      )
                                  ),
                                  child: Column(
                                    spacing: 4,
                                    crossAxisAlignment: .start,
                                    children: [
                                      Text('2025-11-19  13:48:43  到店打卡成功', style: TextStyle(fontSize: 14, fontWeight: .w400, color: Color(0xFF1D2129))),
                                      Text('位置：四川省成都市武侯区高新智慧园2栋402', style: TextStyle(fontSize: 14, fontWeight: .w400, color: Color(0xFF999999))),
                                      Text('偏移：40m', style: TextStyle(fontSize: 14, fontWeight: .w400, color: Color(0xFFF53F3F))),
                                    ],
                                  ),
                                )
                              ],
                            );
                          }),
                          if (clockIn == 3)
                            Padding(padding: EdgeInsets.only(left: 24), child: Text('拜访时长：60分钟', style: TextStyle(fontSize: 14, fontWeight: .w400, color: Color(0xFF1D2129))),)
                        ],
                      if ([1,2].contains(clockIn))
                        ...[
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
                                      color: clockIn == 1 ? Color(0xFF3D7EFF) : Color(0xFFFCBA02)
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: .center,
                                children: [
                                  if (detailType == 1)
                                    ...[
                                      Text(clockIn == 1 ? '拨打电话' : '通话结束', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: .w500)),
                                      Text('$currentTime', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: .w500)),
                                    ]
                                  else if (detailType == 2)
                                    ...[
                                      Text(clockIn == 1 ? '到店打卡' : '离店打卡', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: .w500)),
                                      Text('$currentTime', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: .w500)),
                                      Text('偏移41m', style: TextStyle(color: Color(0xFF999999), fontSize: 16, fontWeight: .w400)),
                                    ]
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                              detailType == 1
                                  ?
                              clockIn == 1 ? '沟通完成后请点击结束任务' : '沟通完成后请点击结束任务'
                                  :
                              clockIn == 1 ? '请到店打卡开始执行任务' : '拜访完成后请离店打卡结束任务', style: TextStyle(color: Color(0xFF999999), fontSize: 14, fontWeight: .w400)),
                        ]
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
                onTap: () {
                  context.push('/bd/home/record/123');
                },
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