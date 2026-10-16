import 'package:flutter/material.dart';

/// 排序状态
enum SortState {
  /// 无排序
  none,

  /// 升序（上三角高亮）
  ascending,

  /// 降序（下三角高亮）
  descending,
}

/// 上下双三角排序图标
class SortTriangleIcon extends StatelessWidget {
  /// 当前排序状态
  final SortState state;

  /// 宽
  final double width;

  /// 高
  final double height;

  /// 激活色（升序/降序时高亮三角的颜色）
  final Color activeColor;

  /// 未激活色（无状态时两个三角的颜色）
  final Color inactiveColor;

  /// 可选：点击回调，用于切换状态
  final VoidCallback? onTap;

  const SortTriangleIcon({
    super.key,
    this.state = SortState.none,
    this.width = 16,
    this.height = 16,
    this.activeColor = const Color(0xFF3D7EFF),
    this.inactiveColor = const Color(0xFF666666),
    this.onTap,
  });

  /// 便捷方法：循环切换状态 none -> ascending -> descending -> none
  static SortState nextState(SortState current) {
    switch (current) {
      case SortState.none:
        return SortState.ascending;
      case SortState.ascending:
        return SortState.descending;
      case SortState.descending:
        return SortState.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    final icon = SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _SortTrianglePainter(
          state: state,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
      ),
    );

    if (onTap == null) return icon;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: icon,
    );
  }
}

class _SortTrianglePainter extends CustomPainter {
  final SortState state;
  final Color activeColor;
  final Color inactiveColor;

  _SortTrianglePainter({
    required this.state,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // SVG 原始设计尺寸为 16x16，这里做等比缩放
    final sx = size.width / 16.0;
    final sy = size.height / 16.0;

    Color topColor;
    Color bottomColor;

    switch (state) {
      case SortState.ascending:
        topColor = activeColor;
        bottomColor = inactiveColor;
        break;
      case SortState.descending:
        topColor = inactiveColor;
        bottomColor = activeColor;
        break;
      case SortState.none:
        topColor = inactiveColor;
        bottomColor = inactiveColor;
        break;
    }

    // 上面的三角（顶点朝上）
    final topPath = Path()
      ..moveTo(7.74776 * sx, 3.68004 * sy)
      ..cubicTo(
        7.87096 * sx,
        3.46668 * sy,
        8.17888 * sx,
        3.46668 * sy,
        8.302 * sx,
        3.68004 * sy,
      )
      ..lineTo(10.1726 * sx, 6.92004 * sy)
      ..cubicTo(
        10.2958 * sx,
        7.1334 * sy,
        10.1418 * sx,
        7.40004 * sy,
        9.89552 * sx,
        7.40004 * sy,
      )
      ..lineTo(6.15424 * sx, 7.40004 * sy)
      ..cubicTo(
        5.90792 * sx,
        7.40004 * sy,
        5.754 * sx,
        7.1334 * sy,
        5.87712 * sx,
        6.92004 * sy,
      )
      ..close();

    // 下面的三角（顶点朝下）
    final bottomPath = Path()
      ..moveTo(8.302 * sx, 12.4 * sy)
      ..cubicTo(
        8.1788 * sx,
        12.6134 * sy,
        7.87088 * sx,
        12.6134 * sy,
        7.74776 * sx,
        12.4 * sy,
      )
      ..lineTo(5.87712 * sx, 9.16004 * sy)
      ..cubicTo(
        5.75392 * sx,
        8.94668 * sy,
        5.90792 * sx,
        8.68004 * sy,
        6.15424 * sx,
        8.68004 * sy,
      )
      ..lineTo(9.89552 * sx, 8.68004 * sy)
      ..cubicTo(
        10.1418 * sx,
        8.68004 * sy,
        10.2958 * sx,
        8.94668 * sy,
        10.1726 * sx,
        9.16004 * sy,
      )
      ..close();

    final paint = Paint()..style = PaintingStyle.fill;

    canvas.drawPath(topPath, paint..color = topColor);
    canvas.drawPath(bottomPath, paint..color = bottomColor);
  }

  @override
  bool shouldRepaint(covariant _SortTrianglePainter oldDelegate) {
    return oldDelegate.state != state ||
        oldDelegate.activeColor != activeColor ||
        oldDelegate.inactiveColor != inactiveColor;
  }
}
