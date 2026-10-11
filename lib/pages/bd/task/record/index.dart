import 'package:flutter/material.dart';
import 'package:study/common/data/index.dart';
import 'package:study/components/image_upload.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/bd/task/components/task_item.dart';

class TaskRecord extends StatefulWidget {
  final String id;
  final bool isEdit;
  const TaskRecord({super.key, required this.id, this.isEdit = false});

  @override
  State<TaskRecord> createState() => _TaskRecordState();
}

class _TaskRecordState extends State<TaskRecord> {
  int detailType = 1; // 1 电话拜访 2 上门拜访
  int clockIn = 3; // 1 未打卡 2 已经打卡 3 结束打卡
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controller.text =
        '这是今天的拜访记录，客户说需要和合伙人商量下看看，下周才能给出结果来，所以就再等等看吧，这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录这就是拜访记录。';
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.isEdit;
    final bottomHeight = MediaQuery.paddingOf(context).bottom;
    const List arr = [1, 2];
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PageBar(title: isEdit ? '填写任务日志' : '任务日志'),
      body: SafeArea(
        bottom: !isEdit,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TaskItem(type: 2),
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      width: .maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: clockIn == 3 ? .start : .center,
                        children: [
                          if (clockIn != 1) ...[
                            ...arr.indexed.map((record) {
                              final (index, item) = record;
                              return Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Row(
                                    spacing: 8,
                                    children: [
                                      Image.asset(
                                        'assets/images/process.png',
                                        width: 16,
                                        height: 16,
                                      ),
                                      Text(
                                        '开始任务',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: .w600,
                                          color: Color(0xFF1D2129),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                      16,
                                      2,
                                      0,
                                      32,
                                    ),
                                    margin: const EdgeInsets.fromLTRB(
                                      7,
                                      0,
                                      0,
                                      0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          width: 2,
                                          color: index < (arr.length - 1)
                                              ? Color(0xFF3D7EFF)
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      spacing: 4,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          '2025-11-19  13:48:43  到店打卡成功',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color(0xFF1D2129),
                                          ),
                                        ),
                                        Text(
                                          '位置：四川省成都市武侯区高新智慧园2栋402',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color(0xFF999999),
                                          ),
                                        ),
                                        Text(
                                          '偏移：40m',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color(0xFFF53F3F),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                            if (clockIn == 3)
                              Padding(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  '拜访时长：60分钟',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFF1D2129),
                                  ),
                                ),
                              ),
                          ],
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      width: .maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '任务记录',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .w600,
                              color: Colors.black.withValues(alpha: 0.9),
                            ),
                          ),
                          // const SizedBox(height: 12),
                          TextField(
                            readOnly: !isEdit,
                            controller: _controller,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            style: TextStyle(
                              color: Color(0xFF1D2129),
                              fontSize: 16,
                              fontWeight: .w400,
                            ),
                            decoration: InputDecoration(
                              hintText: '请输入',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF999999),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                          ImageUpload(
                            isEdit: isEdit,
                            limit: 6,
                            imgsChange: (List<ImageItem?> images) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isEdit)
              Container(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomHeight),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 0.5, color: Color(0xFFDDDDDD)),
                  ),
                ),
                child: GestureDetector(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF3D7EFF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '提交日志',
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
