import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study/components/step_input.dart';

class PickUpGoods extends StatefulWidget {
  final bool onlyReady;
  const PickUpGoods({super.key, this.onlyReady = false});

  @override
  State<PickUpGoods> createState() => _PickUpGoodsState();
}

class _PickUpGoodsState extends State<PickUpGoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
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
                      '昭通丑苹果冰糖心最长就这么长昭通丑苹果冰糖心最长就这么长',
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
                      '货号：826556455',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          '规格：3.5kg/件',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: .w400,
                            color: Color(0xFF999999),
                          ),
                        ),
                        Text(
                          '应取量：2斤',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: .w400,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (widget.onlyReady)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF7F8FA),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    '实取数量(件)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color(0xFF1D2129),
                    ),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: Color(0xFF1D2129),
                    ),
                  ),
                ],
              ),
            )
          else
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  '实取数量(件)',
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
    );
  }
}
