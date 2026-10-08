import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study/components/time_select.dart';

class TimeTab extends StatefulWidget {
  static final List<Map<String, String>> btnlist = [
    {'id': '1', 'name': '昨日', 'type': 'yesterday'},
    {'id': '2', 'name': '今日', 'type': 'today'},
    {'id': '3', 'name': '上月', 'type': 'lmonth'},
    {'id': '4', 'name': '本月', 'type': 'tmonth'},
  ];
  final String currentTab;
  final String? startTime;
  final String? endTime;
  final Function valChange;
  const TimeTab({
    super.key,
    this.currentTab = '',
    this.startTime = '',
    this.endTime = '',
    required this.valChange,
  });

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  late String currentTab;
  late String? startTime;
  late String? endTime;
  late String? maxTime;
  late String? minTime;
  @override
  void initState() {
    super.initState();
    currentTab = widget.currentTab;
    startTime = widget.startTime;
    endTime = widget.endTime;
  }

  void handleChange(Map<String, String> it) {
    if (it['id'] == currentTab) {
      currentTab = '';
      startTime = '';
      endTime = '';
    } else {
      currentTab = it['id'] as String;
      DateTime now = DateTime.now();
      switch (it['type']) {
        case 'yesterday':
          startTime = DateFormat(
            'yyyy-MM-dd',
          ).format(DateTime(now.year, now.month, now.day - 1));
          endTime = DateFormat(
            'yyyy-MM-dd',
          ).format(DateTime(now.year, now.month, now.day - 1));
          break;
        case 'today':
          startTime = DateFormat('yyyy-MM-dd').format(now);
          endTime = DateFormat('yyyy-MM-dd').format(now);
          break;
        case 'lmonth':
          startTime = DateFormat(
            'yyyy-MM-dd',
          ).format(DateTime(now.year, now.month - 1, 1));
          endTime = DateFormat(
            'yyyy-MM-dd',
          ).format(DateTime(now.year, now.month, 0));
          break;
        case 'tmonth':
          startTime = DateFormat(
            'yyyy-MM-dd',
          ).format(DateTime(now.year, now.month, 1));
          endTime = DateFormat('yyyy-MM-dd').format(now);
          break;
        default:
      }
    }
    setState(() {
      currentTab = currentTab;
      startTime = startTime;
      endTime = endTime;
    });
    widget.valChange(currentTab, startTime, endTime);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: const Text(
            '下单时间',
            style: TextStyle(
              fontSize: 14,
              fontWeight: .w600,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            alignment: .spaceBetween,
            children: TimeTab.btnlist.map((it) {
              return GestureDetector(
                key: Key(it['id'] as String),
                onTap: () {
                  handleChange(it);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  decoration: BoxDecoration(
                    color: currentTab == it['id']
                        ? Color(0xFFE2F3F0)
                        : Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    it['name'] as String,
                    style: TextStyle(
                      fontSize: 14,
                      color: currentTab == it['id']
                          ? Color(0xFF27C1A5)
                          : Colors.black87,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: const Text(
            '自定义',
            style: TextStyle(
              fontSize: 14,
              fontWeight: .w600,
              color: Colors.black87,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Expanded(
                child: TimeSelect(
                  key: Key('startTime'),
                  currentTime: startTime,
                  maxTime: (endTime?.isNotEmpty ?? false)
                      ? endTime
                      : DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  placeholder: '起始时间',
                  valChange: (date) {
                    setState(() {
                      startTime = date;
                    });
                    widget.valChange(currentTab, date, endTime);
                  },
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '-',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w400,
                  color: Color(0xFF1D2129),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TimeSelect(
                  key: Key('endTime'),
                  currentTime: endTime,
                  placeholder: '终止时间',
                  minTime: startTime,
                  maxTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  valChange: (date) {
                    setState(() {
                      endTime = date;
                    });
                    widget.valChange(currentTab, startTime, date);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
