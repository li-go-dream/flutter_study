import 'package:flutter/material.dart';
import 'package:study/components/common_tab.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/components/search_input.dart';
import 'package:study/common/data/index.dart';
import 'package:study/pages/driver/components/task_item.dart';

class PickUpTask extends StatefulWidget {
  const PickUpTask({super.key});

  @override
  State<PickUpTask> createState() => _PickUpTaskState();
}

class _PickUpTaskState extends State<PickUpTask> {
  final List<TabItem> list = [
    TabItem(id: '1', name: '待取件', number: 1),
    TabItem(id: '2', name: '已取件', number: 1),
    TabItem(id: '3', name: '已完成', number: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageBar(title: '取件任务'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SearchInput(
                btncolor: 0xFFFF7D00,
                color: Color(0xFFF7F8FA),
                valueChange: () {},
                placeholder: '请输入客户名称进行搜索',
              ),
            ),
            CommonTab(
              list: list,
              indicatorColor: 0xFFFF7D00,
              labelColor: 0xFFFF7D00,
              tabChange: (int cur) {},
            ),
            Expanded(
              child: ScrollLoad(
                color: 0xFFF2F3F5,
                list: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                loadFn: () {
                  debugPrint('11');
                },
                renderItem: (item) {
                  final data = TaskItemData(
                    id: '$item',
                    shopinfo: ShopInfo(
                      shopName: '李四果蔬店武侯分店$item',
                      user: '张三',
                      tel: '13054461324',
                      address: '成都市高新区天府四街199号',
                      distance: 123,
                    ),
                    dirverType: 1,
                    status: 1,
                    type: item == 1 ? 1 : 2,
                  );
                  return TaskItem(key: Key(data.id), item: data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
