import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study/common/goods/index.dart';

class GoodsItem extends StatelessWidget {
  final Goods? item;
  final int operationType; // 1 查看商品 2商品审核
  const GoodsItem({super.key, this.item, this.operationType = 1});
  static const List<Map<String, String>> btnList = [
    {'title': '改库存', 'type': 'stock'},
    {'title': '改价', 'type': 'price'},
    {'title': '素材更新', 'type': 'img'},
    {'title': '下架', 'type': 'down'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://img01.yzcdn.cn/upload_files/2024/04/24/FrpM-wtB4tgmupCOriWeutjyDrpn.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
                    width: 90.0,
                    height: 90.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  // fit: .tight,
                  child: SizedBox(
                    height: 90,
                    child: Column(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .start,
                      children: [
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text.rich(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 4),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF3FFFB),
                                        border: BoxBorder.all(
                                          width: 0.5,
                                          color: Color(0xFF27C1A5),
                                        ),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Text(
                                        '优衣库',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF27C1A5),
                                          fontWeight: .w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多商品名称最多',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '今日销量12件,当前可售200件',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: .w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: .w600,
                            color: Color(0xFF1D2129),
                          ),
                          TextSpan(
                            children: [
                              TextSpan(text: '￥'),
                              TextSpan(
                                text: '109',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              TextSpan(text: '.24/件'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              spacing: 8.0,
              children: btnList.map((it) {
                return Flexible(
                  fit: .tight,
                  child: InkWell(
                    onTap: () {
                      debugPrint(it['title']);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text(
                          it['title'] ?? "",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: .w400,
                            color: Color(0xFF1D2129),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
