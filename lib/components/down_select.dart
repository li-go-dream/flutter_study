import 'package:flutter/material.dart';
import 'package:study/components/custom_alert.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/components/search_input.dart';
import 'package:study/components/time_tab.dart';

class DownSelect extends StatefulWidget {
  final String title;
  final String placeholder;
  final String type;
  const DownSelect({
    super.key,
    this.title = '请选择',
    this.type = 'data',
    this.placeholder = '请选择',
  });

  @override
  State<DownSelect> createState() => _DownSelectState();
}

class _DownSelectState extends State<DownSelect> {
  bool hasMore = true;
  bool loading = false;
  String current = '';
  String startTime = '';
  String endTime = '';
  void chooseData(BuildContext context) {
    bottomDialog(
      context: context,
      title: widget.title,
      customContent: true,
      content: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
              ),
            ),
            child: SearchInput(
              color: Color(0xFFF7F8FA),
              placeholder: '请输入关键字搜索',
              valueChange: (String val) {
                debugPrint(val);
              },
            ),
          ),
          Flexible(
            child: ScrollLoad(
              color: 0xFFFFFFFF,
              loading: loading,
              hasMore: hasMore,
              list: [1, 2, 3, 4],
              loadFn: () {},
              renderItem: (item) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFE7E7E7)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          '分类名称',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: item == 1 ? .w600 : .w400,
                            color: item == 1
                                ? Color(0xFF27C1A5)
                                : Color.fromRGBO(0, 0, 0, 0.90),
                          ),
                        ),
                      ),
                      if (item == 1)
                        Icon(Icons.done, size: 24, color: Color(0xFF27C1A5)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 选择时间
  void chooseDate(BuildContext context) {
    bottomDialog(
      context: context,
      title: widget.title,
      content: TimeTab(
        currentTab: current,
        startTime: startTime,
        endTime: endTime,
        valChange: (cur, sTime, eTime) {
          current = cur;
          startTime = sTime;
          endTime = eTime;
        },
      ),
      fn: (close, isValid) {
        debugPrint(current);
        close(isValid);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.type == 'data' ? chooseData(context) : chooseDate(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.placeholder,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w400,
                  color: Color.fromRGBO(0, 0, 0, 0.90),
                ),
                maxLines: 1,
                overflow: .ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Color.fromRGBO(0, 0, 0, 0.90),
            ),
          ],
        ),
      ),
    );
  }
}
