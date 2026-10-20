import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:study/common/data/bd/echart.dart';
import 'package:study/common/data/index.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/bd/task/components/task_item.dart';

class BdCustomerDetail extends StatefulWidget {
  final String id;
  const BdCustomerDetail({super.key, required this.id});

  @override
  State<BdCustomerDetail> createState() => _BdCustomerDetailState();
}

class _BdCustomerDetailState extends State<BdCustomerDetail> {
  int currentIndex = 0;
  int currentDay = 30;
  final List<TabItem> tabList = [
    TabItem(id: '1', name: '基础信息'),
    TabItem(id: '2', name: '订单信息'),
    TabItem(id: '3', name: '售后信息'),
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

  void handleChooseTime(int day) {
    if (day != currentDay) {
      setState(() {
        currentDay = day;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      appBar: PageBar(title: '采购商详情'),
      body: SafeArea(
        child: Column(
          children: [
            // CommonTab(
            //   labelStyle: TextStyle(
            //     fontSize: 16,
            //     fontWeight: .w400,
            //     color: Color(0xFF000000),
            //   ),
            //   selectlabelstyle: TextStyle(
            //     fontSize: 16,
            //     fontWeight: .w600,
            //     color: Color(0xFF3D7EFF),
            //   ),
            //   hasBottomBorder: false,
            //   indicatorColor: 0xFF3D7EFF,
            //   list: tabList,
            //   tabChange: (int v) {
            //     setState(() {
            //       currentIndex = v;
            //     });
            //   },
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  // margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      TaskItem(type: 4),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      spacing: 1,
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          '今日下单金额（元）',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                        Text(
                                          '109.88',
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: .w600,
                                            color: Color(0xFF3D7EFF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      spacing: 6,
                                      crossAxisAlignment: .end,
                                      children: [
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          children: [
                                            Text(
                                              '较昨日',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w400,
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                            Text(
                                              '+5.63%',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w500,
                                                color: Color(0xFFF53F3F),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          children: [
                                            Text(
                                              '较上周同期',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w400,
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                            Text(
                                              '-1.63%',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w500,
                                                color: Color(0xFF30A056),
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
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text(
                                  '周期下单趋势',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Row(
                                  spacing: 8,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        handleChooseTime(30);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            33,
                                          ),
                                          color: currentDay == 30
                                              ? Color(0xFFEEF3FF)
                                              : Color(0xFFF7F8FA),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 16,
                                        ),
                                        child: Text(
                                          '近30天',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: .w400,
                                            color: currentDay == 30
                                                ? Color(0xFF3D7EFF)
                                                : Color(0xFF666666),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        handleChooseTime(7);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            33,
                                          ),
                                          color: currentDay == 7
                                              ? Color(0xFFEEF3FF)
                                              : Color(0xFFF7F8FA),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6,
                                          horizontal: 16,
                                        ),
                                        child: Text(
                                          '近7天',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: .w400,
                                            color: currentDay == 7
                                                ? Color(0xFF3D7EFF)
                                                : Color(0xFF666666),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 175,
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
                                            (spot, percent, barData, index) {
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
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    rightTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(showTitles: false),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        reservedSize: 30,
                                        showTitles: true,
                                        interval: (dataList.length / 6)
                                            .ceilToDouble(),
                                        getTitlesWidget: (value, meta) {
                                          final cur = dataList[value.toInt()];
                                          final arr = cur.time.split('-');
                                          final year = arr[0];
                                          final time = '${arr[1]}-${arr[2]}';
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
                                                color: Color(0xFF999999), // 线颜色
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
                                                        color:
                                                            Colors.white, // 填充色
                                                        strokeWidth: 1, // 描边宽度
                                                        strokeColor:
                                                            Colors.blue, // 描边颜色
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
                                      tooltipPadding: const EdgeInsets.all(8),
                                      tooltipBorder: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.15),
                                      ),
                                      getTooltipColor: (spot) => Colors.white,
                                      getTooltipItems: (touchedSpots) {
                                        return touchedSpots.map((spot) {
                                          final cur = dataList[spot.x.toInt()];
                                          return LineTooltipItem(
                                            '',
                                            const TextStyle(),
                                            textAlign: .left,
                                            children: [
                                              TextSpan(
                                                text: '${cur.time}\n',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: .w500,
                                                  color: Color(0xFF1D2129),
                                                ),
                                              ),
                                              TextSpan(
                                                text: '下单金额(元)：${cur.val}',
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
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          spacing: 4,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3D7EFF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(
                                          Icons.fmd_good_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '2026-01-20 1天前',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w500,
                                        color: Color(0xFF1D2129),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                    10,
                                    4,
                                    0,
                                    0,
                                  ),
                                  padding: const EdgeInsets.only(left: 17),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 1,
                                        color: Color(0xFFE7E7E7),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FA),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '拜访记录任务记录拜访记录任务记录拜访记录任务记录拜访，记录任务记录拜访记录任务记录，拜访记录任务记录。',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          children: [
                                            Text(
                                              '上门拜访  45分钟',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                            Text(
                                              '拜访人员：BD张三',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3D7EFF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(
                                          Icons.call_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '2026-01-20 1天前',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w500,
                                        color: Color(0xFF1D2129),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                    10,
                                    4,
                                    0,
                                    0,
                                  ),
                                  padding: const EdgeInsets.only(left: 17),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 1,
                                        color: Color(0xFFE7E7E7),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FA),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          children: [
                                            Text(
                                              '电话拜访  45分钟',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                            Text(
                                              '拜访人员：BD张三',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF3D7EFF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(
                                          Icons.fmd_good_outlined,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '2026-01-20 1天前',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w500,
                                        color: Color(0xFF1D2129),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(
                                    10,
                                    4,
                                    0,
                                    0,
                                  ),
                                  padding: const EdgeInsets.only(left: 17),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 1,
                                        color: Color(0xFFE7E7E7),
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7F8FA),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '拜访记录任务记录拜访记录任务记录拜访记录任务记录拜访，记录任务记录拜访记录任务记录，拜访记录任务记录。',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color(0xFF666666),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: .spaceBetween,
                                          children: [
                                            Text(
                                              '上门拜访  45分钟',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                            Text(
                                              '拜访人员：BD张三',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: .w400,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Color(0xFFE5E6EB)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(61, 126, 255, 0.15),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '销售信息',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: .w400,
                            color: Color(0xFF3D7EFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      decoration: BoxDecoration(
                        color: Color(0xFF3D7EFF),
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '售后信息',
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
          ],
        ),
      ),
    );
  }
}
