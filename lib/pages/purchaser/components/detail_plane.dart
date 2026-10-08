import 'package:flutter/material.dart';

class DetailPlane extends StatelessWidget {
  final List<Widget> content;
  final String title;
  final double spacing;
  const DetailPlane({
    super.key,
    required this.content,
    required this.title,
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: .maxFinite,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: spacing,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: .w600,
              color: Color.fromRGBO(0, 0, 0, 0.90),
            ),
          ),
          ...content,
        ],
      ),
    );
  }
}
