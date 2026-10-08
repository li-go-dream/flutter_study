import 'package:flutter/material.dart';

class StepInput extends StatefulWidget {
  final double initVal;
  final double min;
  final double max;
  final double step;
  final Function? valChange;
  final int precision;
  const StepInput({
    super.key,
    this.initVal = 0,
    this.step = 1,
    this.valChange,
    this.precision = 0,
    this.min = 0,
    this.max = 9999,
  });

  @override
  State<StepInput> createState() => _StepInputState();
}

class _StepInputState extends State<StepInput> {
  double value = 0;

  void handleClick(double val) {
    setState(() {
      if (val < 0 && value <= widget.min) return;
      if (val > 0 && value >= widget.max) return;
      value += val;
    });
    if (widget.valChange != null) {
      widget.valChange!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    String showval = value.toStringAsFixed(widget.precision);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            handleClick(-widget.step);
          },
          child: Image.asset(
            'assets/images/remove.png',
            width: 30,
            height: 30,
            fit: .cover,
          ),
        ),
        Container(
          width: 50,
          height: 30,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(color: Color(0xFFF5F6FA)),
          child: Center(
            child: Text(
              showval,
              maxLines: 1,
              overflow: .clip,
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w400,
                color: Colors.black.withValues(alpha: 0.9),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            handleClick(widget.step);
          },
          child: Image.asset(
            'assets/images/add.png',
            width: 30,
            height: 30,
            fit: .cover,
          ),
        ),
      ],
    );
  }
}
