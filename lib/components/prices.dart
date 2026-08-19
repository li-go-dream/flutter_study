import 'package:flutter/material.dart';

class Prices extends StatelessWidget {
  const Prices({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '￥',
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '618',
            style: TextStyle(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: '.26',
            style: TextStyle(
              fontSize: 12,
              color: Colors.red,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
