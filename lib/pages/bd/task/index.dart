import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study/common/data/index.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_datetime_picker_plus/src/datetime_picker_theme.dart'
    as picker_theme;
import 'package:study/common/utils.dart';
import 'package:study/components/common_tab.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/components/search_input.dart';
import 'package:study/pages/bd/task/components/task_item.dart';

class DateList {
  final String id;
  final String day;
  final String dateTime;

  DateList(this.id, this.day, this.dateTime);
}

class BdTaskPage extends StatefulWidget {
  const BdTaskPage({super.key});

  @override
  State<BdTaskPage> createState() => _BdTaskPageState();
}

class _BdTaskPageState extends State<BdTaskPage>
    with SingleTickerProviderStateMixin {
  final List<TabItem> tabs = [
    TabItem(id: '1', name: '待执行'),
    TabItem(id: '2', name: '已完成'),
  ];
  late List<DateList> dates;
  String currentTime = '';
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    getLocatiton();
    setState(() {
      // 获取当前时间
      dates = getTime();
      currentTime = getCurrentTime();
    });
  }

  String getCurrentTime() {
    final d = DateTime.now();
    final year = d.year.toString();
    final month = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  DateList getDateInfo([int offset = 0]) {
    final d = DateTime.now().add(Duration(days: offset));
    const weekdays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    const weekchinaDays = ['昨天', '今天', '明天'];

    final year = d.year.toString();
    final month = d.month.toString().padLeft(2, '0');
    final day = d.day.toString().padLeft(2, '0');
    return DateList(
      '$year-$month-$day',
      '$month-$day',
      offset <= 1 ? weekchinaDays[offset + 1] : weekdays[d.weekday - 1],
    );
  }

  List<DateList> getTime() {
    List<DateList> arr = [];
    for (int i = -1; i <= 5; i++) {
      arr.add(getDateInfo(i));
    }
    return arr;
  }

  void handleChoose(DateList data) {
    setState(() {
      currentTime = data.id;
    });
  }

  // 获取定位
  void getLocatiton() async {
    getAnimation();
    final (result: success, position: pos) = await getLocation();
    if (success) {
      print(pos);
    }
    _controller.stop();
    _controller.value = 1;
  }

  // 添加定位动画
  void getAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 0.1,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // 选择时间
  void handleChooseTime(BuildContext context) async {
    final rootContext = Navigator.of(context, rootNavigator: true).context;
    DatePicker.showDatePicker(
      rootContext,
      currentTime: DateTime.tryParse(currentTime),
      onConfirm: (time) {
        String val = DateFormat('yyyy-MM-dd').format(time);
        setState(() {
          print(val);
          // current = time;
        });
      },
      theme: picker_theme.DatePickerTheme(
        cancelStyle: const TextStyle(color: Color(0xFF666666)),
        doneStyle: const TextStyle(color: Color(0xFF3D7EFF)),
        itemStyle: const TextStyle(
          fontSize: 16,
          fontWeight: .w500,
          color: Color.fromRGBO(0, 0, 0, 0.90),
        ),
      ),
      locale: LocaleType.zh,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          children: [
                            AnimatedBuilder(
                              animation: _opacity,
                              builder: (context, _) {
                                return Icon(
                                  Icons.fmd_good_outlined,
                                  size: 24,
                                  color: Color(
                                    0xFF1D1429,
                                  ).withValues(alpha: _opacity.value),
                                );
                              },
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              size: 24,
                              color: Color(0xFF1D2129),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 12),
                    margin: EdgeInsets.only(bottom: 13),
                    child: SizedBox(
                      height: 48,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            right: 48,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                spacing: 8,
                                children: List.generate(
                                  dates.length,
                                  (index) => GestureDetector(
                                    onTap: () {
                                      handleChoose(dates[index]);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: currentTime == dates[index].id
                                            ? Color(0xFF3D7EFF)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: .center,
                                        children: [
                                          Text(
                                            dates[index].dateTime,
                                            style: TextStyle(
                                              color:
                                                  currentTime == dates[index].id
                                                  ? Colors.white
                                                  : Color(0xFF1D2129),
                                              fontSize: 10,
                                              fontWeight: .w400,
                                            ),
                                          ),
                                          Text(
                                            dates[index].day,
                                            style: TextStyle(
                                              color:
                                                  currentTime == dates[index].id
                                                  ? Colors.white
                                                  : Color(0xFF1D2129),
                                              fontSize: 16,
                                              fontWeight: .w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // 左侧 SVG 阴影
                                Positioned(
                                  left: -24,
                                  top: 0,
                                  child: IgnorePointer(
                                    child: Image.asset(
                                      'assets/images/calendar-shadow.png',
                                      width: 24,
                                      height: 48,
                                    ),
                                  ),
                                ),
                                // 日历容器
                                GestureDetector(
                                  onTap: () {
                                    handleChooseTime(context);
                                  },
                                  child: SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Transform.translate(
                                          offset: const Offset(0, 6),
                                          child: const Icon(
                                            Icons.calendar_month_outlined,
                                            color: Color(0xFF1D2129),
                                            size: 24,
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(0, -0),
                                          child: const Icon(
                                            Icons.arrow_drop_down_outlined,
                                            color: Color(0xFF1D2129),
                                            size: 24,
                                          ),
                                        ),
                                      ],
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F8F8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          CommonTab(
                            list: tabs,
                            hasBottomBorder: false,
                            indicatorColor: 0xFF3D7EFF,
                            labelStyle: TextStyle(
                              color: Color(0xFF1D2129),
                              fontSize: 16,
                              fontWeight: .w400,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  _currentIndex == 0
                                      ? 'assets/images/tab-left.png'
                                      : 'assets/images/tab-right.png',
                                ),
                              ),
                            ),
                            selectlabelstyle: TextStyle(
                              color: Color(0xFF3D7EFF),
                              fontSize: 16,
                              fontWeight: .w600,
                            ),
                            tabChange: (index) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 12,
                            ),
                            child: SearchInput(
                              placeholder: '请输入采购商名称',
                              btncolor: 0xFF3D7EFF,
                              valueChange: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: .spaceBetween,
                              children: [
                                Text.rich(
                                  WidgetSpan(
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '拜访',
                                              style: TextStyle(
                                                color: Color(0xFF3D7EFF),
                                                fontSize: 16,
                                                fontWeight: .w600,
                                              ),
                                            ),
                                            Text(
                                              '任务',
                                              style: TextStyle(
                                                color: Color(0xFF1D2129),
                                                fontSize: 16,
                                                fontWeight: .w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 2,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 6,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                61,
                                                126,
                                                255,
                                                0.22,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  spacing: 12,
                                  children: [
                                    Text(
                                      '今日任务 20',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 13,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                    Text(
                                      '已完成 20',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 13,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                    Text(
                                      '拜托下单 11',
                                      style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 13,
                                        fontWeight: .w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ScrollLoad(
                              list: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                              loadFn: () => debugPrint('1'),
                              renderItem: (item) {
                                return TaskItem(key: Key('$item'));
                              },
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
