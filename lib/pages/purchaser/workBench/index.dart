import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/user/index.dart';

class PurchaserWorkBenchPage extends StatelessWidget {
  const PurchaserWorkBenchPage({super.key});
  static List<WorkBenchItem> list = [
    WorkBenchItem(
      title: '商品管理',
      desc: '随时更新',
      img: 'assets/images/shop.png',
      url: '/goodsManagement',
      color: Color(0xFFFFFAF6),
    ),
    WorkBenchItem(
      title: '供应商管理',
      desc: '助力审核',
      img: 'assets/images/gongyinshang.png',
      url: '/supplierManagement',
      color: Color.fromRGBO(39, 193, 165, 0.05),
    ),
    WorkBenchItem(
      title: '订单管理',
      desc: '省时高效',
      url: '/orderManagement',
      img: 'assets/images/order.png',
      color: Color(0xFFF6F8FF),
    ),
    WorkBenchItem(
      title: '售后管理',
      desc: '方便快捷',
      url: '/afterSalesManagement',
      img: 'assets/images/shouhou.png',
      color: Color(0xFFFFF1F1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage('assets/images/top-extra-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              height: 140,
              child: Center(
                child: Text(
                  '工作台',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: .w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Stack(
              fit: .expand,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -20,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      spacing: 10.0,
                      mainAxisAlignment: .spaceBetween,
                      children: list.map((item) {
                        return Flexible(
                          fit: .tight,
                          child: InkWell(
                            onTap: () {
                              context.push('purchaser${item.url}');
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Image.asset(
                                      item.img,
                                      width: item.imgHeight,
                                      height: item.imgHeight,
                                    ),
                                    const SizedBox(height: 3.0),
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: .w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      item.desc,
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: .w400,
                                        color: Color(0xFF999999),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
