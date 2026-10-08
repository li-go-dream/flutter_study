import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/data/index.dart';
import 'package:study/common/utils.dart';

class TaskItem extends StatelessWidget {
  final TaskItemData item;

  const TaskItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          if (item.dirverType == 2)
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/images/not-stock.png',
                width: 50,
                height: 50,
              ),
            ),
          Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    item.shopinfo.shopName,
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w600,
                      color: Color(0xFF1D2129),
                    ),
                  ),
                  if (item.dirverType == 1) ...[
                    const SizedBox(width: 8),
                    Text(
                      item.type == 1 ? '取框' : '取货',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: .w400,
                        color: Color(item.type == 1 ? 0xFF00B42A : 0XFF3491FA),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.person, size: 14, color: Color(0xFF999999)),
                  const SizedBox(width: 6),
                  Text(
                    item.shopinfo.tel,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: Color(0xFF999999)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      item.shopinfo.address,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ),
                  Text(
                    '3.15km',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        makingCall(item.shopinfo.tel);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              size: 16,
                              color: Color(0xFF1D2129),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '拨号',
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                              color: Color(0xFF1D2129),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '导航',
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
                  if (item.status == 2 ||
                      (item.dirverType == 2 && item.status == 1))
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF7D00),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.done_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item.status == 2 ? '送达' : '开始发货',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (item.dirverType == 2 && item.status == 3)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF7D00),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.done_outlined,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '送达详情',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (item.dirverType == 1) {
                    context.push('/driver/pickupList/21');
                  } else {
                    context.push('/driver/deliveryList/21');
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xFFFFF7E8),
                  ),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        item.dirverType == 1 ? '取件清单' : '核货清单',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF1D2129),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_outlined,
                        size: 16,
                        color: Color(0xFF1D2129),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
