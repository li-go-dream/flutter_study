import 'package:flutter/material.dart';

class OrderStatus extends StatelessWidget {
  final int orderStatus;
  const OrderStatus({super.key, required this.orderStatus});

  (String, int) getData() {
    int color = 0xFF666666;
    String text = '待付款'; // 1 待付款 2待发货 3已发货 4 售后中 5已关闭
    switch (orderStatus) {
      case 1:
        text = '待付款';
        color = 0xFF666666;
        break;
      case 2:
        text = '待发货';
        color = 0xFFF53F3F;
        break;
      case 3:
        text = '已发货';
        color = 0xFF00B42A;
        break;
      case 4:
        text = '售后中';
        color = 0xFF666666;
        break;
      case 5:
        text = '已关闭';
        color = 0xFF666666;
        break;
      default:
    }
    return (text, color);
  }

  @override
  Widget build(BuildContext context) {
    final (text, color) = getData();
    return Text(
      text,
      style: TextStyle(fontSize: 12, fontWeight: .w400, color: Color(color)),
    );
  }
}
