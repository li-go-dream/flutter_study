import 'package:flutter/material.dart';

class TimeItem {
  final int id;
  final String name;
  TimeItem({required this.id, required this.name});
}

class BdMyPage extends StatefulWidget {
  const BdMyPage({super.key});

  @override
  State<BdMyPage> createState() => _BdMyPageState();
}

class _BdMyPageState extends State<BdMyPage> {
  final List<TimeItem> timeList = [
    TimeItem(id: 1, name: '本月'),
    TimeItem(id: 2, name: '本周'),
    TimeItem(id: 3, name: '昨日'),
    TimeItem(id: 4, name: '今日'),
  ];

  int currentTime = 4;

  @override
  void initState() {
    super.initState();
  }

  void handleChoose(TimeItem item) {
    setState(() {
      currentTime = item.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f3f6),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 295,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bd-bg.png'),
                  // alignment: .topCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'bill',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: .w500,
                            color: Color(0XFF1D2129),
                          ),
                        ),
                        Row(
                          spacing: 24,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '我的邀请码',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .w400,
                                  color: Color(0xFF3D7EFF),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.settings_outlined,
                                size: 24,
                                color: Color(0xFF1D1429),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: .spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '50',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: .w700,
                                        color: Color(0xFF1D2129),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '今日拜访',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w400,
                                        color: Color(0xFF999999),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 24,
                                  width: 1,
                                  color: Color(0xFFE7E7E7),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '15',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: .w700,
                                        color: Color(0xFF1D2129),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '今日拜访',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w400,
                                        color: Color(0xFF999999),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        Text(
                                          '目标达成',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: .w600,
                                            color: Color(0xFF1D2129),
                                          ),
                                        ),
                                        Row(
                                          spacing: 8,
                                          children: timeList
                                              .map(
                                                (item) => GestureDetector(
                                                  onTap: () =>
                                                      handleChoose(item),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 4,
                                                          horizontal: 12,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          currentTime == item.id
                                                          ? Color(0xFFEEF3FF)
                                                          : Color(0xFFF7F7F9),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      item.name,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: .w400,
                                                        color:
                                                            currentTime ==
                                                                item.id
                                                            ? Color(0xFF3D7EFF)
                                                            : Color.fromRGBO(
                                                                0,
                                                                0,
                                                                0,
                                                                0.60,
                                                              ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
