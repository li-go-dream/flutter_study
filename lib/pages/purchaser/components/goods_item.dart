import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter/services.dart';
import 'package:study/common/goods/index.dart';
import 'package:study/common/dialog/index.dart';
import 'package:study/common/input/index.dart';
import 'package:study/components/custom_alert.dart';
import 'package:study/components/image_upload.dart';
import 'package:study/pages/purchaser/components/goods_msg.dart';
import 'package:study/common/data/index.dart';

class GoodsItem extends StatelessWidget {
  final Goods? item;
  final String operationType; // 1 查看商品 2商品审核
  const GoodsItem({super.key, this.item, this.operationType = '1'});
  static const List<Map<String, String>> btnList = [
    {'title': '改库存', 'type': 'stock', 'operation': '1'},
    {'title': '改价', 'type': 'price', 'operation': '1'},
    {'title': '素材更新', 'type': 'img', 'operation': '1'},
    {'title': '下架', 'type': 'down', 'operation': '1'},
    {'title': '驳回', 'type': 'reject', 'operation': '2'},
    {'title': '审核通过', 'type': 'pass', 'operation': '2'},
  ];

  // 操作
  void handleOpertation(Map<String, String> item, BuildContext context) {
    switch (item['type']) {
      case 'stock':
        updateStock(item, context);
        break;
      case 'price':
        updatePrices(item, context);
        break;
      case 'img':
        updateImgs(item, context);
        break;
      case 'down':
        showDownUpDialog(item, context);
        break;
      case 'reject':
        showPassJectUpDialog(item, context, 'reject');
        break;
      case 'pass':
        showPassJectUpDialog(item, context, 'pass');
        break;
      default:
        break;
    }
  }

  // 改库存
  void updateStock(Map<String, String> item, BuildContext ctx) {
    bottomDialog(
      context: ctx,
      title: '改库存',
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          TextEditingController controller = TextEditingController(text: '0');
          return Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                const GoodsMsg(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      const Text(
                        '今日已售件数',
                        style: TextStyle(
                          color: Color(0xFF1D2129),
                          fontSize: 14,
                          fontWeight: .w400,
                        ),
                      ),
                      const Text(
                        '345件',
                        style: TextStyle(
                          color: Color(0xFF1D2129),
                          fontSize: 14,
                          fontWeight: .w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      const Text(
                        '当前可售库存',
                        style: TextStyle(
                          color: Color(0xFF1D2129),
                          fontSize: 14,
                          fontWeight: .w400,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 68,
                            // height: 32,
                            margin: EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6FA),
                              borderRadius: BorderRadius.circular(4),
                              // border: BoxBorder.all(width: 0),
                            ),
                            child: TextField(
                              textAlign: .center,
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                  0,
                                  4,
                                  0,
                                  4,
                                ),
                                isDense: true, //去掉默认的额外间距
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                // 1. 先过滤掉所有非数字字符（防止输入 -、.、a 等）
                                CallBackTextInputFormatter.digitsOnly(),
                                // 2. 再校验数值是否大于等于 0（拦截 负数 和 异常值）
                                CallBackTextInputFormatter.nonNegativeInt(),
                              ],
                            ),
                          ),
                          const Text(
                            '件',
                            style: TextStyle(
                              color: Color(0xFF1D2129),
                              fontSize: 14,
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
          );
        },
      ),
      fn: (cancelFn, val) {
        cancelFn(val);
      },
    );
  }

  // 改价格
  void updatePrices(Map<String, String> item, BuildContext ctx) {
    bottomDialog(
      context: ctx,
      title: '改价格',
      height: 0.4,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          TextEditingController controller = TextEditingController(text: '0');
          return Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                const GoodsMsg(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      const Text(
                        '件单价',
                        style: TextStyle(
                          color: Color(0xFF1D2129),
                          fontSize: 14,
                          fontWeight: .w400,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 68,
                            // height: 32,
                            margin: EdgeInsets.only(right: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F6FA),
                              borderRadius: BorderRadius.circular(4),
                              // border: BoxBorder.all(width: 0),
                            ),
                            child: TextField(
                              textAlign: .center,
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                  0,
                                  4,
                                  0,
                                  4,
                                ),
                                isDense: true, //去掉默认的额外间距
                                border: InputBorder.none,
                              ),
                              inputFormatters: [
                                CallBackTextInputFormatter.price(),
                              ],
                            ),
                          ),
                          const Text(
                            '元',
                            style: TextStyle(
                              color: Color(0xFF1D2129),
                              fontSize: 14,
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
          );
        },
      ),
      fn: (cancelFn, val) {
        cancelFn(val);
      },
    );
  }

  // 素材更新
  void updateImgs(Map<String, String> item, BuildContext ctx) {
    List<ImageItem?> headimg = [
      ImageItem(
        id: '1',
        url:
            'https://img01.yzcdn.cn/upload_files/2024/04/24/FrpM-wtB4tgmupCOriWeutjyDrpn.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
        islocal: '2',
      ),
    ];
    List<ImageItem?> goodsimg = [];
    bottomDialog(
      context: ctx,
      title: '素材更新',
      height: 0.7,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Column(
              children: [
                const GoodsMsg(),
                const SizedBox(height: 16),
                SizedBox(
                  width: .infinity,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      const Text(
                        '商品主图',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w500,
                          color: Color.fromRGBO(0, 0, 0, 0.90),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ImageUpload(
                        list: headimg,
                        limit: 1,
                        imgsChange: (List<ImageItem?> images) {
                          headimg = images;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '商品轮播图(最多6张)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w500,
                          color: Color.fromRGBO(0, 0, 0, 0.90),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ImageUpload(
                        list: goodsimg,
                        limit: 6,
                        imgsChange: (List<ImageItem?> images) {
                          goodsimg = images;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      fn: (cancelFn, val) {
        print(headimg);
        print(goodsimg);
        cancelFn(val);
      },
    );
  }

  // 上下架弹窗
  void showDownUpDialog(Map<String, String> item, BuildContext context) async {
    customDialog(
      context,
      DialogPar(content: '是否下架商品', cancelText: '取消', okText: '确认'),
      (cancelFn, val) {
        cancelFn(val);
      },
    );
  }

  // 驳回或通过
  void showPassJectUpDialog(
    Map<String, String> item,
    BuildContext context,
    String type,
  ) async {
    customDialog(
      context,
      DialogPar(
        content: '是否${type == 'reject' ? '驳回' : '通过'}审核',
        cancelText: '取消',
        okText: '确认',
      ),
      (cancelFn, val) {
        cancelFn(val);
      },
    );
  }

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
            GestureDetector(
              onTap: () =>
                  context.push('/purchaser/goodsManagement/goodDetail/123'),
              child: Row(
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
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
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
            ),
            const SizedBox(height: 10.0),
            Row(
              spacing: 8.0,
              children: btnList
                  .where((it) => it['operation'] == operationType)
                  .map((it) {
                    return Flexible(
                      fit: .tight,
                      child: InkWell(
                        onTap: () {
                          handleOpertation(it, context);
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
                  })
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
