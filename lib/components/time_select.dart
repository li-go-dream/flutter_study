import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_datetime_picker_plus/src/datetime_picker_theme.dart'
    as picker_theme;

class TimeSelect extends StatefulWidget {
  final String placeholder;
  final String? currentTime;
  final String? minTime;
  final String? maxTime;
  final Function? valChange;
  const TimeSelect({
    super.key,
    this.placeholder = '请选择',
    this.currentTime,
    this.minTime,
    this.maxTime,
    this.valChange,
  });

  @override
  State<TimeSelect> createState() => _TimeSelectState();
}

class _TimeSelectState extends State<TimeSelect> {
  late DateTime? current;
  late DateTime? minTime;
  late DateTime? maxTime;
  @override
  void initState() {
    super.initState();
    initVal();
    formatTime();
  }

  void initVal() {
    String? wcurrentTime = widget.currentTime;
    List? fcurrent = (wcurrentTime != null && wcurrentTime.isNotEmpty)
        ? wcurrentTime.split('-').map((it) => int.parse(it)).toList()
        : [];
    current = fcurrent.isNotEmpty
        ? DateTime(fcurrent[0], fcurrent[1], fcurrent[2])
        : null;
  }

  void formatTime() {
    String? wminTime = widget.minTime;
    String? wmaxTime = widget.maxTime;
    List? fminTime = (wminTime != null && wminTime.isNotEmpty)
        ? wminTime.split('-').map((it) => int.parse(it)).toList()
        : [];
    List? fmaxTime = (wmaxTime != null && wmaxTime.isNotEmpty)
        ? wmaxTime.split('-').map((it) => int.parse(it)).toList()
        : [];
    maxTime = fmaxTime.isNotEmpty
        ? DateTime(fmaxTime[0], fmaxTime[1], fmaxTime[2])
        : null;
    minTime = fminTime.isNotEmpty
        ? DateTime(fminTime[0], fminTime[1], fminTime[2])
        : null;
  }

  @override
  void didUpdateWidget(covariant TimeSelect oldWidget) {
    super.didUpdateWidget(oldWidget);
    initVal();
    formatTime();
  }

  void handleChooseTime(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      maxTime: maxTime,
      minTime: minTime,
      currentTime: current ?? DateTime.now(),
      onConfirm: (time) {
        String val = DateFormat('yyyy-MM-dd').format(time);
        setState(() {
          current = time;
        });
        widget.valChange?.call(val);
      },
      theme: picker_theme.DatePickerTheme(
        cancelStyle: const TextStyle(color: Color(0xFF666666)),
        doneStyle: const TextStyle(color: Color(0xFF27C1A5)),
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
    final currentValue = current;
    String showVal = currentValue != null
        ? DateFormat('yyyy-MM-dd').format(currentValue)
        : '';
    return GestureDetector(
      onTap: () {
        handleChooseTime(context);
      },
      child: Container(
        width: .maxFinite,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          showVal.isNotEmpty ? showVal : widget.placeholder,
          maxLines: 1,
          overflow: .ellipsis,
          style: TextStyle(
            fontSize: 14,
            fontWeight: .w400,
            color: showVal.isNotEmpty ? Colors.black87 : Color(0xFFBDBDBD),
          ),
        ),
      ),
    );
  }
}
