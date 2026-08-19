import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/components/prices.dart';
import 'package:study/pages/purchaser/components/detail_item.dart';
import 'package:study/pages/purchaser/components/detail_plane.dart';

class OrderDetail extends StatefulWidget {
  final String id;
  const OrderDetail({super.key, required this.id});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(title: '待发货'),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: .startTop,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFF5F6FA)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            DetailPlane(
                              title: '配送信息',
                              content: [
                                DetailItem(label: '发货方式', value: '直送'),
                                DetailItem(label: '采购商名称', value: '采购商店铺名称'),
                                DetailItem(
                                  label: '供应商名称',
                                  value: '这里显示供应商店铺名称',
                                ),
                                DetailItem(
                                  label: '收货地址',
                                  value:
                                      '四川省成都市武侯区高新智慧园2栋4404大箱子上张三丰13838384380',
                                ),
                              ],
                            ),
                            DetailPlane(
                              title: '商品信息',
                              spacing: 0,
                              content: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 0.5,
                                        color: Color(0xFFE5E6EB),
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://img01.yzcdn.cn/upload_files/2026/06/26/Fh_FoRN3hVShsOVk7RDo9J_ElsJX.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
                                          width: 68,
                                          height: 68,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              maxLines: 2,
                                              overflow: .ellipsis,
                                              '【供应商名称】商品名称最长商品名称最长商品名称最长商品名称最长',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF1D2129),
                                                fontWeight: .w400,
                                              ),
                                            ),
                                            Text(
                                              '500ml | 规格显示',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.40,
                                                ),
                                                fontSize: 12,
                                                fontWeight: .w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        mainAxisAlignment: .center,
                                        crossAxisAlignment: .end,
                                        children: [
                                          Prices(),
                                          Text(
                                            '共2件',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: .w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://img01.yzcdn.cn/upload_files/2026/06/26/Fh_FoRN3hVShsOVk7RDo9J_ElsJX.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
                                          width: 68,
                                          height: 68,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              maxLines: 2,
                                              overflow: .ellipsis,
                                              '【供应商名称】商品名称最长商品名称最长商品名称最长商品名称最长',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF1D2129),
                                                fontWeight: .w400,
                                              ),
                                            ),
                                            Text(
                                              '500ml | 规格显示',
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.40,
                                                ),
                                                fontSize: 12,
                                                fontWeight: .w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        mainAxisAlignment: .center,
                                        crossAxisAlignment: .end,
                                        children: [
                                          Prices(),
                                          Text(
                                            '共2件',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: .w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            DetailPlane(
                              title: '支付信息',
                              content: [
                                DetailItem(
                                  label: '订单号码',
                                  value: 'DD017192874091028739187',
                                ),
                                DetailItem(
                                  label: '下单时间',
                                  value: '2025-10-18  18:23:23',
                                ),
                                DetailItem(label: '支付方式', value: '微信支付'),
                                DetailItem(
                                  label: '支付时间',
                                  value: '2025-10-18  18:23:23',
                                ),
                                DetailItem(label: '商品金额', value: '¥20.98'),
                                DetailItem(label: '运费', value: '¥10.00'),
                                DetailItem(label: '实付款', value: '¥30.98'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFDDDDDD), width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  InkWell(
                    onTap: () {
                      context.push(
                        '/purchaser/afterSalesManagement/afterDetail/111',
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                      child: Text(
                        '查看售后',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF1D2129),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
