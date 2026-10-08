import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study/common/goods/index.dart';

class GoodsMsg extends StatelessWidget {
  const GoodsMsg({super.key, Goods? item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFE7E7E7))),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: .start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
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
                  child: SizedBox(
                    height: 90.0,
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text.rich(
                          maxLines: 2,
                          overflow: .ellipsis,
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
                        Text.rich(
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: .w600,
                            color: Color(0xFFF53F3F),
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
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
