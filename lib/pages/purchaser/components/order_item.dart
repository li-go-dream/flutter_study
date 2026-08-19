import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study/common/data/index.dart';
import 'package:study/components/prices.dart';
import 'package:study/pages/purchaser/components/order_status.dart';
import 'package:study/pages/purchaser/components/order_type.dart';

class OrderItem extends StatelessWidget {
  final OrderData item;
  const OrderItem({
    super.key,
    this.item = const OrderData(
      id: '1',
      supplierName: '供应商名称供应商名称供应商名称', // 供应商名称
      purchaserName: '采购商名称', // 采购商名称
      goodsDesc: '商品描述商品描述', // 商品描述
      orderType: 1, // 1 直通订单 2 直送订单
      imgs: [
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        'https://img01.yzcdn.cn/upload_files/2021/04/27/FnjuFv4TPSp-nirkTIDZ-vnC-a0_.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
      ], // 商品图片
      orderTime: '2026-02-12 10:21:10', // 订单时间
      prices: 210.2, // 订单价格
      number: 12, // 订单数量
      orderStatus: 2, // 1 待付款 2待发货 3已发货 4 售后中 5已关闭
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/full-shop.png', width: 16, height: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        overflow: .ellipsis,
                        item.supplierName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w500,
                          color: Color.fromRGBO(0, 0, 0, 0.90),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    OrderType(orderType: item.orderType),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
              OrderStatus(orderStatus: item.orderStatus),
            ],
          ),
          Container(
            width: .maxFinite,
            margin: EdgeInsets.only(top: 12, bottom: 8),
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    spacing: 8,
                    children: item.imgs.map((it) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: it,
                          width: 80,
                          height: 80,
                          fit: .cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  right: 0,
                  width: 80,
                  height: 80,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .end,
                      children: [
                        Prices(),
                        Text(
                          '共${item.number}件',
                          style: TextStyle(fontSize: 12, fontWeight: .w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                item.orderTime,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF999999),
                  fontWeight: .w400,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  textAlign: .right,
                  maxLines: 1,
                  overflow: .ellipsis,
                  item.purchaserName,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF999999),
                    fontWeight: .w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
