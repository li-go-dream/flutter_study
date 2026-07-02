import 'package:flutter/material.dart';

class HomeData extends StatefulWidget {
  const HomeData({super.key});

  @override
  State<HomeData> createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  bool isday = false;

  void handleChoose(bool val) {
    setState(() {
      isday = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      color: Color(int.parse('FF27C1A5', radix: 16)),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  '目标达成',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Color(int.parse('FF1D2129', radix: 16)),
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 12.0,
                        ),
                        backgroundColor: Color(
                          int.parse(isday ? 'FFF7F7F9' : 'FFF3FFFB', radix: 16),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        side: BorderSide(
                          color: Color(
                            int.parse(
                              isday ? 'FFF7F7F9' : 'FF27C1A5',
                              radix: 16,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => handleChoose(false),
                      child: Text(
                        '昨日',
                        style: TextStyle(
                          color: isday
                              ? Color.fromRGBO(0, 0, 0, 0.6)
                              : Color(int.parse('FF27C1A5', radix: 16)),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 12.0,
                        ),
                        backgroundColor: Color(
                          int.parse(
                            !isday ? 'FFF7F7F9' : 'FFF3FFFB',
                            radix: 16,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        side: BorderSide(
                          color: Color(
                            int.parse(
                              !isday ? 'FFF7F7F9' : 'FF27C1A5',
                              radix: 16,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () => handleChoose(true),
                      child: Text(
                        '今日',
                        style: TextStyle(
                          color: !isday
                              ? Color.fromRGBO(0, 0, 0, 0.6)
                              : Color(int.parse('FF27C1A5', radix: 16)),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Text(
                          '售卖金额(元)',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF999999),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '1315.6',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1D2129),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text(
                              '较昨日',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            Text(
                              '+4.5%',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF53F3F),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text(
                              '较上周同期',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            Text(
                              '+4.5%',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF27C1A5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: VerticalDivider(
                      thickness: 1,
                      width: 1.0,
                      color: Color(int.parse('FFE7E7E7', radix: 16)),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        const Text(
                          '售卖商品数(件)',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF999999),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            '9711',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1D2129),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text(
                              '较昨日',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            Text(
                              '+4.5%',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF27C1A5),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const Text(
                              '较上周同期',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            Text(
                              '+4.5%',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF53F3F),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
