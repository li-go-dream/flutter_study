import 'package:flutter/material.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/bd/task/components/task_item.dart';

class TaskRecord extends StatefulWidget {
  final String id;
  final bool isEdit;
  const TaskRecord({ super.key, required this.id, this.isEdit = false });

  @override
  State<TaskRecord> createState() => _TaskRecordState();
}

class _TaskRecordState extends State<TaskRecord> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.isEdit;
    final bottomHeight = MediaQuery.paddingOf(context).bottom;
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PageBar(title: isEdit ? '填写任务日志' : '任务日志'),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  TaskItem(type: 2)
                ],
              ),
            )),
            if (isEdit)
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
                          color: Color(0xFF3D7EFF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text('提交日志', style: TextStyle(fontSize: 16, fontWeight: .w400, color: Colors.white),),
                        ),
                      ),
                    )
                ),
              )
          ],
        )
      ),
    );
  }
}