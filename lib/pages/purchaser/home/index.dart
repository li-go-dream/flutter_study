import 'package:flutter/material.dart';
import 'package:study/pages/purchaser/components/home_data.dart';
import 'package:study/pages/purchaser/components/home_tab.dart';
import 'package:study/common/user/index.dart';
import 'package:study/pages/purchaser/home/components/await_page.dart';
import 'package:study/pages/purchaser/home/components/delivery_page.dart';
import 'package:study/pages/purchaser/home/components/supplier_page.dart';

class PurchaserHomePage extends StatefulWidget {
  const PurchaserHomePage({super.key});

  @override
  State<PurchaserHomePage> createState() => _PurchaserHomePageState();
}

class _PurchaserHomePageState extends State<PurchaserHomePage> {
  List<ListItem> tabList = [
    ListItem(title: '商品待办', hot: true, type: 'await', page: const AwaitPage()),
    ListItem(
      title: '供应商入驻',
      hot: false,
      type: 'supplier',
      page: const SupplierPage(),
    ),
    ListItem(
      title: '订单发货',
      hot: false,
      type: 'delivery',
      page: const DeliveryPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: .fromHeight(height),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/top-extra-bg.png'),
              alignment: .topCenter,
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(top: height),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                const Text(
                  '采购经理A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          HomeData(),
          Flexible(child: HomeTab(list: tabList)),
        ],
      ),
    );
  }
}
