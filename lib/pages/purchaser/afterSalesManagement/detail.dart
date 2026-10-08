import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/components/prices.dart';
import 'package:study/pages/purchaser/components/detail_item.dart';
import 'package:study/pages/purchaser/components/detail_plane.dart';

class AfterSalesDetail extends StatefulWidget {
  final String id;
  const AfterSalesDetail({super.key, required this.id});
  static const List<Map<String, String>> list = [
    {
      'key': '1',
      'name': '待供应商收货',
      'desc': '货物已寄出，请等待供应商收货',
      'time': '2024-09-01 12:56',
    },
    {
      'key': '2',
      'name': '待采购商退货',
      'desc': '物流公司：圆通快递，物流单号：YT1255545469',
      'time': '2024-09-01 12:56',
    },
    {
      'key': '3',
      'name': '待供应商处理',
      'desc': '退货退款申请已提交，请等待供应商处理，供应商联系电话为18741547863，如未及时处理可电话联系供应商协商处理',
      'time': '2024-09-01 12:56',
    },
    {
      'key': '4',
      'name': '申请原因',
      'desc': '退货退款-商品质量问题',
      'time': '2024-09-01 12:56',
    },
  ];

  @override
  State<AfterSalesDetail> createState() => _AfterSalesDetailState();
}

class _AfterSalesDetailState extends State<AfterSalesDetail> {
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageBar(title: '售后详情'),
      backgroundColor: Color(0xFFF5F6FA),
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
                            Container(
                              width: .maxFinite,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 16,
                              ),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: .topCenter,
                                  end: .bottomCenter,
                                  colors: [
                                    Color(0xFFF3F9FF),
                                    Color(0xFFFFFFFF),
                                  ],
                                  stops: [0.0, 0.105],
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '退款金额',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: .w400,
                                          color: Color(0xFF1D2129),
                                        ),
                                      ),
                                      // const SizedBox(height: 8),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '￥',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: .w400,
                                                color: Color(0xFF1D2129),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '182.3',
                                              style: TextStyle(
                                                fontSize: 36,
                                                fontWeight: .w500,
                                                color: Color(0xFF1D2129),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 26),
                                      SizedBox(
                                        width: .maxFinite,
                                        child: Column(
                                          crossAxisAlignment: .start,
                                          children: [
                                            Text(
                                              '售后流程',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: .w600,
                                                color: Color.fromRGBO(
                                                  0,
                                                  0,
                                                  0,
                                                  0.90,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            ...AfterSalesDetail.list.asMap().entries.map((
                                              entry,
                                            ) {
                                              final index = entry.key;
                                              final item = entry.value;
                                              return Container(
                                                padding: EdgeInsets.only(
                                                  bottom: 6,
                                                ),
                                                child: Column(
                                                  key: Key(item['key'] ?? ''),
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          index == 0
                                                              ? 'assets/images/check-radio.png'
                                                              : 'assets/images/uncheck-radio.png',
                                                          width: 13,
                                                          height: 13,
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            item['name'] ?? '',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: .w500,
                                                              color: index == 0
                                                                  ? Color(
                                                                      0xFF27C1A5,
                                                                    )
                                                                  : Color.fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.40,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    IntrinsicHeight(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 1,
                                                            color: Color(
                                                              0xFFE7E7E7,
                                                            ),
                                                            margin:
                                                                EdgeInsets.only(
                                                                  left: 6,
                                                                ),
                                                          ),
                                                          const SizedBox(
                                                            width: 14,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  .start,
                                                              children: [
                                                                Text(
                                                                  item['desc'] ??
                                                                      '',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        .w400,
                                                                    color:
                                                                        Color.fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.40,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  item['time'] ??
                                                                      '',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        .w400,
                                                                    color:
                                                                        Color.fromRGBO(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0.40,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            DetailPlane(
                              title: '退款信息',
                              spacing: 0,
                              content: [
                                const SizedBox(height: 8),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
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
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 4,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F6FA),
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '售后数量',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w400,
                                                    color: Color(0xFF666666),
                                                  ),
                                                ),
                                                TextSpan(text: ' '),
                                                TextSpan(
                                                  text: '2',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w500,
                                                    color: Color(0xFF27C1A5),
                                                  ),
                                                ),
                                                TextSpan(text: ' '),
                                                TextSpan(
                                                  text: '件',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w400,
                                                    color: Color(0xFF666666),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F6FA),
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '应退金额',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w400,
                                                    color: Color(0xFF666666),
                                                  ),
                                                ),
                                                TextSpan(text: ' '),
                                                TextSpan(
                                                  text: '￥2.33',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w500,
                                                    color: Color(0xFF27C1A5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F6FA),
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '实退金额',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w400,
                                                    color: Color(0xFF666666),
                                                  ),
                                                ),
                                                TextSpan(text: ' '),
                                                TextSpan(
                                                  text: '￥2.33',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: .w500,
                                                    color: Color(0xFF27C1A5),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
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
                                      const SizedBox(height: 8),
                                      Wrap(
                                        spacing: 4,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F6FA),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '售后数量',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF666666),
                                                    ),
                                                  ),
                                                  TextSpan(text: ' '),
                                                  TextSpan(
                                                    text: '2',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFF27C1A5),
                                                    ),
                                                  ),
                                                  TextSpan(text: ' '),
                                                  TextSpan(
                                                    text: '件',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF666666),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F6FA),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '应退金额',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF666666),
                                                    ),
                                                  ),
                                                  TextSpan(text: ' '),
                                                  TextSpan(
                                                    text: '￥2.33',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFF27C1A5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF5F6FA),
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                            child: Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '实退金额',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w400,
                                                      color: Color(0xFF666666),
                                                    ),
                                                  ),
                                                  TextSpan(text: ' '),
                                                  TextSpan(
                                                    text: '￥2.33',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: .w500,
                                                      color: Color(0xFF27C1A5),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                              title: '售后信息',
                              content: [
                                DetailItem(label: '售后类型', value: '退货退款'),
                                DetailItem(
                                  label: '售后提交时间',
                                  value: '2025-10-18  18:23:23',
                                ),
                                DetailItem(
                                  label: '采购商名称',
                                  value: '这里显示采购商店铺名称',
                                ),
                                DetailItem(
                                  label: '供应商名称',
                                  value: '这里显示供应商商店铺名称',
                                ),
                              ],
                            ),
                            DetailPlane(
                              title: '订单信息',
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
          ],
        ),
      ),
    );
  }
}
