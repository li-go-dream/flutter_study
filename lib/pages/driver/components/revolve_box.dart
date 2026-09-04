import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study/components/step_input.dart';

class RevolveBox extends StatefulWidget {
  final bool onlyReady;
  const RevolveBox({super.key, this.onlyReady = false});

  @override
  State<RevolveBox> createState() => _RevolveBoxState();
}

class _RevolveBoxState extends State<RevolveBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl:
                  'https://img0.baidu.com/it/u=2883467091,3717480636&fm=253&fmt=auto&app=138&f=JPEG?w=1200&h=800',
              width: 76,
              height: 76,
              fit: .cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  '周转框名称周转框名称',
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w600,
                    color: Color(0xFF323232),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '应取数量：8',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: .w400,
                    color: Color(0xFF999999),
                  ),
                ),
                const SizedBox(height: 4),
                if (widget.onlyReady)
                  Text(
                    '实取数量：8',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color(0xFF999999),
                    ),
                  )
                else
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        '实取数量',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF1D2129),
                        ),
                      ),
                      StepInput(),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
