import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/data/index.dart';
import 'package:study/components/common_tab.dart';
import 'package:study/components/down_select.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/components/search_input.dart';
import 'package:study/pages/purchaser/components/order_item.dart';

class OrderManagement extends StatefulWidget {
  const OrderManagement({super.key});

  @override
  State<OrderManagement> createState() => _OrderManagementState();
}

class _OrderManagementState extends State<OrderManagement> {
  String value = '11';
  int curIndex = 0;
  bool hasMore = true;
  bool loading = false;
  List<TabItem> list = [
    TabItem(id: '1', name: '全部', number: 0),
    TabItem(id: '2', name: '待发货', number: 0),
    TabItem(id: '3', name: '已发货', number: 0),
    TabItem(id: '4', name: '已完成', number: 0),
    TabItem(id: '5', name: '售后/关闭', number: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: PageBar(title: '订单管理'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: SearchInput(
              placeholder: '请输入订单商品',
              valueChange: (String val) {
                value = val;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: DownSelect(placeholder: '选择供应商', title: '选择供应商'),
                ),
                Expanded(
                  child: DownSelect(
                    placeholder: '全部下单时间',
                    title: '选择下单时间',
                    type: 'date',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: CommonTab(
              list: list,
              tabChange: (int currentIndex) {
                setState(() {
                  curIndex = currentIndex;
                });
              },
            ),
          ),
          Expanded(
            child: ScrollLoad(
              color: 0xFFF5F6FA,
              loading: loading,
              hasMore: loading,
              list: [1, 2, 3, 4, 5, 6, 7],
              loadFn: () {},
              renderItem: (item) {
                return GestureDetector(
                  onTap: () {
                    context.push('/purchaser/orderManagement/orderDetail/11');
                  },
                  child: OrderItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
