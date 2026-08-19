import 'package:flutter/material.dart';

class DialogPar {
  final String content;
  final TextStyle? contentStyle;
  final String? cancelText;
  final int cancelColor;
  final String? okText;
  final int okColor;
  final bool showbtn;
  const DialogPar({
    required this.content,
    this.cancelText,
    this.okText,
    this.cancelColor = 0xFF1D2129,
    this.okColor = 0xFF27C1A5,
    this.showbtn = true,
    this.contentStyle = const TextStyle(
      color: Color(0xFF1D2129),
      fontSize: 16,
      fontWeight: .w400,
    ),
  });
}

typedef CloseCallback = void Function(bool? result); // 关闭弹窗并返回结果
typedef FnType = void Function(CloseCallback close, bool isValid);
