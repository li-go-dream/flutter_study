import 'package:flutter/services.dart';

/// 输入限制回调
class CallBackTextInputFormatter extends TextInputFormatter {
  final TextEditingValue Function(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  )
  onFormat;

  const CallBackTextInputFormatter(this.onFormat);

  // 静态方法：只保留数字
  static TextEditingValue _digitsOnly(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String cleaned = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (cleaned.isEmpty) return newValue.copyWith(text: '');
    if (cleaned != newValue.text) {
      return newValue.copyWith(
        text: cleaned,
        selection: TextSelection.collapsed(offset: cleaned.length),
      );
    }
    return newValue;
  }

  // 命名构造：只允许输入数字（但允许前导零，如 01）
  const CallBackTextInputFormatter.digitsOnly() : this(_digitsOnly);

  // 静态方法：校验数值 >= 0
  static TextEditingValue _minZero(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;
    if (newValue.text.isEmpty) return newValue;
    final number = int.tryParse(newValue.text);
    // 注意：如果输入了前导零如 01，int.tryParse 会解析为 1
    if (number == null || number < 0) {
      return oldValue;
    }
    // 判断去掉前导0
    String strippedText = number.toString();
    if (strippedText != text) {
      return newValue.copyWith(
        text: strippedText,
        selection: TextSelection.collapsed(offset: strippedText.length),
      );
    }
    return newValue;
  }

  // 命名构造：只允许 >= 0 的数字（最终推荐使用的）
  const CallBackTextInputFormatter.nonNegativeInt() : this(_minZero);

  // 价格
  static TextEditingValue priceFormat(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // 1. 允许为空（方便用户删光重输）
    if (text.isEmpty) return newValue;

    // 2. 过滤掉所有非数字和非小数点的字符
    String filtered = text.replaceAll(RegExp(r'[^0-9.]'), '');
    if (filtered != text) {
      return newValue.copyWith(
        text: filtered,
        selection: TextSelection.collapsed(offset: filtered.length),
      );
    }

    // 3. 禁止输入多个小数点（只保留第一个）
    int dotCount = '.'.allMatches(filtered).length;
    if (dotCount > 1) {
      return oldValue; // 回退到修改前的值，阻止输入
    }

    // 4. 限制小数位数最多 2 位
    int dotIndex = filtered.indexOf('.');
    if (dotIndex != -1) {
      String decimalPart = filtered.substring(dotIndex + 1);
      if (decimalPart.length > 2) {
        return oldValue; // 超过两位小数，拦截
      }
    }

    // 5. 处理前导零（核心：防止 01、00.1 等）
    if (filtered.startsWith('0') && filtered.length > 1) {
      // 特例：允许 "0." 这种中间状态（用户想输入 0.5）
      if (filtered[1] == '.') {
        // 直接放行 "0."
      } else {
        // 去除所有前导零
        int i = 0;
        while (i < filtered.length && filtered[i] == '0') i++;
        if (i == filtered.length) {
          filtered = '0'; // 全是零 -> 归零
        } else if (filtered[i] == '.') {
          // 如 "00.1" -> 处理为 "0.1"
          filtered = '0${filtered.substring(i)}';
        } else {
          // 如 "012.3" -> 处理为 "12.3"
          filtered = filtered.substring(i);
        }
        return newValue.copyWith(
          text: filtered,
          selection: TextSelection.collapsed(offset: filtered.length),
        );
      }
    }

    // 6. 处理用户直接输入 "." 的情况 -> 自动补全为 "0."
    if (filtered == '.') {
      return newValue.copyWith(
        text: '0.',
        selection: const TextSelection.collapsed(offset: 2),
      );
    }

    // 7. 最终结构校验（防止空字符串或纯点的情况）
    if (RegExp(r'^(\d+)?(\.\d{0,2})?$').hasMatch(filtered)) {
      return newValue;
    }
    return oldValue;
  }

  const CallBackTextInputFormatter.price() : this(priceFormat);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return onFormat(oldValue, newValue);
  }
}
