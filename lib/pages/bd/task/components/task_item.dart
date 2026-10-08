import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/utils.dart';
import 'package:study/pages/bd/task/components/status_select.dart';
import 'package:study/pages/bd/task/components/label.dart';

class TaskItem extends StatelessWidget {
  final int type;
  const TaskItem({super.key, this.type = 1}); // 1 任务 2 任务详情

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, type == 1 ? 10 : 0, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '采购商用户名称店铺名称采购商用户名称店铺名称采购商用户名称店铺名称采购商用户名称店铺名称采购商用户名称店铺名称',
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: TextStyle(fontSize: 16, fontWeight: .w600),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, color: Color(0xFF000000)),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Label(status: 1),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 1,
                  ),
                  child: Text(
                    '自动下发',
                    style: TextStyle(
                      color: Color(0xFF1D2129),
                      fontSize: 14,
                      fontWeight: .w400,
                    ),
                  ),
                ),
              ),
              Text(
                '日常拜访任务的任务名称',
                style: TextStyle(
                  color: Color(0xFF1D2129),
                  fontSize: 14,
                  fontWeight: .w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '张先生  18908098080',
            style: TextStyle(
              fontSize: 14,
              fontWeight: .w400,
              color: Color(0xFF999999),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '四川省-成都市-武侯区-桂溪街道',
            style: TextStyle(
              fontSize: 14,
              fontWeight: .w400,
              color: Color(0xFF999999),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '3.4km',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/airplane-fill.png',
                      width: 16,
                      height: 16,
                    ),
                  ],
                ),
              ),
              StatusSelect(edit: false),
            ],
          ),
          if (type == 1)
            ...[
              const SizedBox(height: 12),
              Row(
                spacing: 8,
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        makingCall('13086697391');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.call_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '拨打电话',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .w400,
                                color: Color(0xFF1D2129),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        context.push('/bd/home/detail/11');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.text_snippet_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '执行详情',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .w400,
                                color: Color(0xFF1D2129),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(Icons.edit_note_outlined, size: 16),
                            // Icon(Icons.visibility_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '填写日志',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .w400,
                                color: Color(0xFF1D2129),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ],
      ),
    );
  }
}
