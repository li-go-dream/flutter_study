import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/data/bd/echart.dart';
import 'package:study/common/dialog/index.dart';
import 'package:study/components/custom_alert.dart';

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

  final List<TimeItem> echartTimeList = [
    TimeItem(id: 1, name: '近30天'),
    TimeItem(id: 2, name: '近7天'),
  ];

  final List<TimeForVal> dataList = [
    TimeForVal(time: '2026-01-12', val: 200),
    TimeForVal(time: '2026-01-13', val: 23),
    TimeForVal(time: '2026-01-14', val: 41.23),
    TimeForVal(time: '2026-01-15', val: 123.66),
    TimeForVal(time: '2026-01-16', val: 420.1),
    TimeForVal(time: '2026-01-17', val: 225.7),
    TimeForVal(time: '2026-01-18', val: 690),
    TimeForVal(time: '2026-01-19', val: 590.88),
    TimeForVal(time: '2026-01-12', val: 200),
    TimeForVal(time: '2026-01-13', val: 23),
    TimeForVal(time: '2026-01-14', val: 41.23),
    TimeForVal(time: '2026-01-15', val: 123.66),
    TimeForVal(time: '2026-01-16', val: 420.1),
    TimeForVal(time: '2026-01-17', val: 225.7),
    TimeForVal(time: '2026-01-18', val: 690),
    TimeForVal(time: '2026-01-19', val: 590.88),
  ];

  final List<TimeForVal> data1List = [
    TimeForVal(time: '2026-01-12', val: 100),
    TimeForVal(time: '2026-01-13', val: 223),
    TimeForVal(time: '2026-01-14', val: 871.23),
    TimeForVal(time: '2026-01-15', val: 23.66),
    TimeForVal(time: '2026-01-16', val: 410.1),
    TimeForVal(time: '2026-01-17', val: 115.7),
    TimeForVal(time: '2026-01-18', val: 390),
    TimeForVal(time: '2026-01-19', val: 93.88),
    TimeForVal(time: '2026-01-12', val: 158),
    TimeForVal(time: '2026-01-13', val: 29),
    TimeForVal(time: '2026-01-14', val: 81.23),
    TimeForVal(time: '2026-01-15', val: 223.66),
    TimeForVal(time: '2026-01-16', val: 220.1),
    TimeForVal(time: '2026-01-17', val: 525.7),
    TimeForVal(time: '2026-01-18', val: 298),
    TimeForVal(time: '2026-01-19', val: 890.88),
  ];

  int currentTime = 4;
  int echartTime = 1;

  @override
  void initState() {
    super.initState();
  }

  void handleChoose(TimeItem item, int type) {
    setState(() {
      if (type == 1) {
        currentTime = item.id;
      } else {
        echartTime = item.id;
      }
    });
  }

  void handleInvitationCode(BuildContext context) {
    customDialog(
      context,
      DialogPar(
        content: '邀请码：6GYx4',
        cancelText: '取消',
        okText: '复制',
        okColor: 0xFF3D7EFF,
      ),
      (destory, val) async {
        await Clipboard.setData(ClipboardData(text: '6GYx4'));
        Fluttertoast.showToast(msg: '复制成功', gravity: .CENTER);
        destory(val);
      },
    );
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
                              onTap: () {
                                handleInvitationCode(context);
                              },
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
                              onTap: () {
                                context.push('/bd/customer/setting');
                              },
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
                            child: Column(
                              children: [
                                Row(
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
                                          '线索添加',
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
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFF3D7EFF),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '去执行',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: .w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
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
                                                      handleChoose(item, 1),
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
                                const SizedBox(height: 12),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              '下单金额(元)',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              '45,198.09',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: .w700,
                                                color: Color(0xFF1D2129),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            if (currentTime == 4) ...[
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较昨日',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+4.82%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFFF53F3F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较上周同期',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '-8.50%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFF30A056),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            if (currentTime == 2)
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较上周',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+4.82%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFFF53F3F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (currentTime == 1)
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较上月',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+4.82%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFFF53F3F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                      const VerticalDivider(
                                        width: 33, // 占位宽度（含 margin）
                                        thickness: 1, // 线宽
                                        color: Color(0xFFE7E7E7),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              '下单金额(元)',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              '45,198.09',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: .w700,
                                                color: Color(0xFF1D2129),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            if (currentTime == 4) ...[
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较昨日',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+4.82%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFFF53F3F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较上周同期',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '-8.50%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFF30A056),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                            if (currentTime == 2)
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较上周',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+4.82%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFFF53F3F),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            if (currentTime == 1)
                                              Row(
                                                mainAxisAlignment:
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    '较上月',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+4.82%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
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
                                          '周期趋势',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: .w600,
                                            color: Color(0xFF1D2129),
                                          ),
                                        ),
                                        Row(
                                          spacing: 8,
                                          children: echartTimeList
                                              .map(
                                                (item) => GestureDetector(
                                                  onTap: () =>
                                                      handleChoose(item, 2),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 4,
                                                          horizontal: 12,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          echartTime == item.id
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
                                                            echartTime ==
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
                                const SizedBox(height: 16),
                                Row(
                                  spacing: 24,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 1,
                                          color: Color(0XFF30A056),
                                        ),
                                        Text(
                                          '下单金额(元)',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: .w400,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 1,
                                          color: Color(0XFF3D7EFF),
                                        ),
                                        Text(
                                          '下单客户数(家)',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: .w400,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                SizedBox(
                                  height: 210,
                                  child: LineChart(
                                    LineChartData(
                                      lineBarsData: [
                                        LineChartBarData(
                                          // 数据点：(x, y) 坐标
                                          spots: dataList.indexed.map((record) {
                                            final (index, item) = record;
                                            return FlSpot(
                                              index.toDouble(),
                                              item.val,
                                            );
                                          }).toList(),
                                          isCurved: true, // 曲线平滑
                                          preventCurveOverShooting: true,
                                          color: Colors.blue, // 线条颜色
                                          barWidth: 1, // 线宽
                                          dotData: FlDotData(
                                            show: true,
                                            getDotPainter:
                                                (
                                                  spot,
                                                  percent,
                                                  barData,
                                                  index,
                                                ) {
                                                  return FlDotCirclePainter(
                                                    radius: 1,
                                                    color: Colors.white,
                                                    strokeWidth: 1,
                                                    strokeColor: Colors.blue,
                                                  );
                                                },
                                          ),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(
                                                  0xFF3D7EFF,
                                                ).withValues(alpha: 0.3),
                                                Color(
                                                  0xFF3D7EFF,
                                                ).withValues(alpha: 0.05),
                                              ],
                                            ),
                                          ),
                                        ),
                                        LineChartBarData(
                                          // 数据点：(x, y) 坐标
                                          spots: data1List.indexed.map((
                                            record,
                                          ) {
                                            final (index, item) = record;
                                            return FlSpot(
                                              index.toDouble(),
                                              item.val,
                                            );
                                          }).toList(),
                                          isCurved: true, // 曲线平滑
                                          preventCurveOverShooting: true,
                                          color: Color(0xFF30A056), // 线条颜色
                                          barWidth: 1, // 线宽
                                          dotData: FlDotData(
                                            show: true,
                                            getDotPainter:
                                                (
                                                  spot,
                                                  percent,
                                                  barData,
                                                  index,
                                                ) {
                                                  return FlDotCirclePainter(
                                                    radius: 1,
                                                    color: Colors.white,
                                                    strokeWidth: 1,
                                                    strokeColor: Colors.blue,
                                                  );
                                                },
                                          ),
                                          belowBarData: BarAreaData(
                                            show: true,
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(
                                                  0xFF30A056,
                                                ).withValues(alpha: 0.3),
                                                Color(
                                                  0xFF30A056,
                                                ).withValues(alpha: 0.05),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                      borderData: FlBorderData(
                                        show: true,
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 1,
                                            color: Color(0xFF999999),
                                          ),
                                        ),
                                      ),
                                      gridData: const FlGridData(
                                        show: true,
                                        drawVerticalLine: false,
                                      ),
                                      titlesData: FlTitlesData(
                                        show: true,
                                        topTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        rightTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        leftTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            showTitles: false,
                                          ),
                                        ),
                                        bottomTitles: AxisTitles(
                                          sideTitles: SideTitles(
                                            reservedSize: 30,
                                            showTitles: true,
                                            interval: (dataList.length / 6)
                                                .ceilToDouble(),
                                            getTitlesWidget: (value, meta) {
                                              final cur =
                                                  dataList[value.toInt()];
                                              final arr = cur.time.split('-');
                                              final year = arr[0];
                                              final time =
                                                  '${arr[1]}-${arr[2]}';
                                              return Column(
                                                children: [
                                                  Text(
                                                    year,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                  Text(
                                                    time,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF999999),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      lineTouchData: LineTouchData(
                                        enabled: true,
                                        getTouchedSpotIndicator:
                                            (
                                              LineChartBarData barData,
                                              List<int> spotIndexes,
                                            ) {
                                              return spotIndexes.map((index) {
                                                return TouchedSpotIndicatorData(
                                                  FlLine(
                                                    color: Color(
                                                      0xFF999999,
                                                    ), // 线颜色
                                                    strokeWidth: 1.5, // 线宽
                                                    dashArray: [
                                                      5,
                                                      0,
                                                    ], // 虚线效果：[实线长, 间隔长]
                                                  ),
                                                  // --- 2. 点的样式 (FlDotData) ---
                                                  FlDotData(
                                                    show: true, // 显示触摸点
                                                    getDotPainter:
                                                        (
                                                          spot,
                                                          percent,
                                                          barData,
                                                          index,
                                                        ) {
                                                          // 返回一个自定义的点绘制器
                                                          return FlDotCirclePainter(
                                                            radius: 2, // 点的半径
                                                            color: Colors
                                                                .white, // 填充色
                                                            strokeWidth:
                                                                1, // 描边宽度
                                                            strokeColor: Colors
                                                                .blue, // 描边颜色
                                                          );
                                                        },
                                                  ),
                                                );
                                              }).toList();
                                            },
                                        touchTooltipData: LineTouchTooltipData(
                                          tooltipBorderRadius:
                                              BorderRadius.circular(4),
                                          fitInsideHorizontally: true,
                                          maxContentWidth: 140,
                                          tooltipPadding: const EdgeInsets.all(
                                            8,
                                          ),
                                          tooltipBorder: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                              0,
                                              0,
                                              0,
                                              0.15,
                                            ),
                                          ),
                                          getTooltipColor: (spot) =>
                                              Colors.white,
                                          getTooltipItems: (touchedSpots) {
                                            return touchedSpots.map((spot) {
                                              final isFirst =
                                                  spot == touchedSpots.first;
                                              final cur =
                                                  dataList[spot.x.toInt()];
                                              return LineTooltipItem(
                                                '',
                                                const TextStyle(),
                                                textAlign: .left,
                                                children: [
                                                  if (isFirst)
                                                    TextSpan(
                                                      text: '${cur.time}\n',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: .w500,
                                                        color: Color(
                                                          0xFF1D2129,
                                                        ),
                                                      ),
                                                    ),
                                                  TextSpan(
                                                    text:
                                                        '${isFirst ? "下单金额(元)" : "下单客户数(家)"}：${spot.y}',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFF1D2129),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
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
