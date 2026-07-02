import 'package:flutter/material.dart';
import 'package:study/pages/purchaser/components/home_data.dart';
import 'package:study/pages/purchaser/components/home_tab.dart';
import 'package:study/common/user/index.dart';

class PurchaserHomePage extends StatefulWidget {
  const PurchaserHomePage({super.key});

  @override
  State<PurchaserHomePage> createState() => _PurchaserHomePageState();
}

class _PurchaserHomePageState extends State<PurchaserHomePage> {
  List<ListItem> tabList = [
    ListItem(title: '商品待办', hot: true, type: 'await'),
    ListItem(title: '供应商入驻', hot: false, type: 'await'),
    ListItem(title: '订单发货', hot: false, type: 'await'),
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
          HomeTab(list: tabList),
        ],
      ),
    );
  }
}
