import 'package:flutter/material.dart';

class OrderType extends StatelessWidget {
  final int orderType;
  const OrderType({super.key, required this.orderType});

  @override
  Widget build(BuildContext context) {
    Widget content;
    int borderColor;
    if (orderType == 1) {
      // 1 直通订单 2 直送订单
      content = Text(
        '直通订单',
        style: TextStyle(
          fontSize: 10,
          fontWeight: .w400,
          color: Color(0xFF00B42A),
        ),
      );
      borderColor = 0xFFAFF0B5;
    } else {
      content = Text(
        '直送订单',
        style: TextStyle(
          fontSize: 10,
          fontWeight: .w400,
          color: Color(0xFF3491FA),
        ),
      );
      borderColor = 0xFFC3E7FE;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(width: 0.5, color: Color(borderColor)),
      ),
      child: content,
    );
  }
}
