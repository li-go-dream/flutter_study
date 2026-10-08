import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    '司机-张三',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: .w500,
                      color: Color(0xFF1D2129),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/chooseRole');
                    },
                    child: Image.asset(
                      'assets/images/setting_black.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push('/driver/deliverytask');
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: const EdgeInsets.all(24),
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
                        Image.asset(
                          'assets/images/car-blue-icon.png',
                          width: 62,
                          height: 62,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            // color: Color(0xFFF2F3F5),
                            color: Color(0xFFF53F3F),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '3 待发货',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w500,
                                  // color: Color(0xFF666666),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Text(
                      '送货任务',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: .w500,
                        color: Color(0xFF1D2129),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '点击查看当前配送任务清单与路线',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.push('/driver/pickuptask');
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: const EdgeInsets.all(24),
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
                        Image.asset(
                          'assets/images/box-yellow-icon.png',
                          width: 62,
                          height: 62,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F3F5),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '0 待取件',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w500,
                                  color: Color(0xFF666666),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 34),
                    Text(
                      '取件任务',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: .w500,
                        color: Color(0xFF1D2129),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '点击查看当前取件任务清单与路线',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
