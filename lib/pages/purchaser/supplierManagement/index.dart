import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/data/index.dart';
import 'package:study/components/common_tab.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/components/search_input.dart';
import 'package:study/pages/purchaser/components/supplier_item.dart';

class SupplierManagement extends StatefulWidget {
  const SupplierManagement({super.key});

  @override
  State<SupplierManagement> createState() => _SupplierManagementState();
}

class _SupplierManagementState extends State<SupplierManagement> {
  String value = '11';
  int curIndex = 0;
  bool hasMore = true;
  bool loading = false;
  List<TabItem> list = [
    TabItem(id: '1', name: '全部', number: 123),
    TabItem(id: '5', name: '已启用', number: 235),
    TabItem(id: '2', name: '已注册', number: 235),
    TabItem(id: '3', name: '待审核', number: 283),
    TabItem(id: '4', name: '已驳回', number: 666),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: PageBar(
        title: '供应商管理',
        rightFn: () {
          context.push('/purchaser/supplierManagement/register');
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: SearchInput(
              placeholder: '请输入商品编码或商品名称查询',
              valueChange: (String val) {
                value = val;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: CommonTab(
              isScrollable: true,
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
                return SupplierItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
