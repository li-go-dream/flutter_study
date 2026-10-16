import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/utils.dart';
import 'package:study/pages/bd/task/components/status_select.dart';
import 'package:study/pages/bd/task/components/label.dart';

class TaskItem extends StatelessWidget {
  final int type;
  const TaskItem({super.key, this.type = 1}); // 1 任务 2 任务详情 3 客户列表 4 客户详情

  void handleClick(BuildContext context) {
    if (type == 1) {
    } else if (type == 2) {
    } else if (type == 3) {
      context.push('/bd/customer/detail/123');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleClick(context),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, [1, 3].contains(type) ? 10 : 0, 12, 0),
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
                          maxLines: type == 4 ? null : 1,
                          overflow: type == 4 ? null : .ellipsis,
                          style: TextStyle(fontSize: 16, fontWeight: .w600),
                        ),
                      ),
                      if (type != 4)
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFF000000),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                if ([1, 2].contains(type))
                  Label(status: 1)
                else if (type == 3)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '30天未拜访',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w400,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
              ],
            ),
            if ([1, 2].contains(type)) ...[
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
            ],
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
                if (type == 3)
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Color(0xFFF53F3F),
                        fontWeight: .w600,
                      ),
                      children: [
                        TextSpan(text: '¥', style: TextStyle(fontSize: 12)),
                        TextSpan(text: '109', style: TextStyle(fontSize: 24)),
                        TextSpan(text: '.24', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  )
                else if ([1, 2].contains(type))
                  StatusSelect(edit: false),
              ],
            ),
            if (type == 1) ...[
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
            ],
            if (type == 4) ...[
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
                            Icon(Icons.fmd_good_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '开始导航',
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
                            Icon(Icons.add_outlined, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '添加拜访',
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
            ],
          ],
        ),
      ),
    );
  }
}
