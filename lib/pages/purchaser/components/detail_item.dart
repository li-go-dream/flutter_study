import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String label;
  final String? value;
  final String unitText;
  final bool isRow;
  final bool isshow;
  final Widget? content;
  const DetailItem({
    super.key,
    required this.label,
    this.value,
    this.isRow = true,
    this.isshow = true,
    this.unitText = '',
    this.content,
  });

  Widget judeContent() {
    final child = content ?? const SizedBox.shrink();
    if (isshow) {
      // 显示
      return isRow
          ? Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: .w400,
                    color: Color.fromRGBO(0, 0, 0, 0.60),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    textAlign: .right,
                    value ?? '',
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: Color.fromRGBO(0, 0, 0, 0.90),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(
              width: .maxFinite,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                  Text(
                    textAlign: .right,
                    value ?? '',
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: Color.fromRGBO(0, 0, 0, 0.90),
                    ),
                  ),
                ],
              ),
            );
    } else {
      // 编辑
      return isRow
          ? Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: .w400,
                    color: Color.fromRGBO(0, 0, 0, 0.60),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
                    children: [
                      child,
                      if (unitText.isNotEmpty)
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            Text(
                              unitText,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .w400,
                                color: Color.fromRGBO(0, 0, 0, 0.60),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            )
          : SizedBox(
              width: .maxFinite,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                  child,
                ],
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return judeContent();
  }
}
