import 'package:flutter/material.dart';
import 'package:study/common/utils.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/components/search_input.dart';
import 'package:study/components/sort_triangle_icon.dart';
import 'package:study/pages/bd/task/components/task_item.dart';

class BtnItem {
  final int id;
  final String name;

  BtnItem({required this.id, required this.name});
}

class SortItem {
  final int id;
  final String name;
  SortState sort;

  SortItem({required this.id, required this.name, required this.sort});
}

class BdCustomerPage extends StatefulWidget {
  const BdCustomerPage({super.key});

  @override
  State<BdCustomerPage> createState() => _BdCustomerPageState();
}

class _BdCustomerPageState extends State<BdCustomerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  int orderType = 1;

  final List<BtnItem> btnList = [
    BtnItem(id: 1, name: '全部客户'),
    BtnItem(id: 2, name: '已下单'),
    BtnItem(id: 3, name: '未下单'),
  ];

  List<SortItem> sortList = [
    SortItem(id: 1, name: '距离远近', sort: SortState.none),
    SortItem(id: 2, name: '下单金额', sort: SortState.none),
    SortItem(id: 3, name: '未拜访天数', sort: SortState.none),
  ];

  @override
  void initState() {
    super.initState();
    getLocatiton();
  }

  // 获取定位
  void getLocatiton() async {
    getAnimation();
    final (result: success, position: pos) = await getLocation();
    if (success) {
      print(pos);
    }
    _controller.stop();
    _controller.value = 1;
  }

  // 添加定位动画
  void getAnimation() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _opacity = Tween<double>(
      begin: 0.1,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void handleSort(SortItem item) {
    setState(() {
      for (final it in sortList) {
        if (it.id == item.id) {
          it.sort = SortTriangleIcon.nextState(it.sort);
        } else {
          it.sort = SortState.none; // 其他项复位
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf2f3f6),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 295,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bd-bg.png'),
                  // alignment: .topCenter,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'bill',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: .w500,
                            color: Color(0XFF1D2129),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _opacity,
                          builder: (context, _) {
                            return Icon(
                              Icons.fmd_good_outlined,
                              size: 24,
                              color: Color(
                                0xFF1D1429,
                              ).withValues(alpha: _opacity.value),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: SearchInput(
                      placeholder: '请输入采购商名称',
                      btncolor: 0xFF3D7EFF,
                      valueChange: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      spacing: 10,
                      children: btnList.map((item) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                orderType = item.id;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: orderType == item.id
                                    ? Color(0xFFE2ECFF)
                                    : Color(0xFFF7F8FA),
                                border: Border.all(
                                  width: 1,
                                  color: orderType == item.id
                                      ? Color(0xFF3D7EFF)
                                      : Color(0xFFF7F8FA),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: orderType == item.id
                                        ? Color(0xFF3D7EFF)
                                        : Color(0xFF666666),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          spacing: 12,
                          children: sortList.map((it) {
                            return GestureDetector(
                              onTap: () {
                                handleSort(it);
                              },
                              child: Flex(
                                key: Key('${it.id}'),
                                direction: .horizontal,
                                children: [
                                  Text(
                                    it.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: .w400,
                                      color: it.sort != SortState.none
                                          ? Color(0xFF3D7EFF)
                                          : Color(0xFF666666),
                                    ),
                                  ),
                                  SortTriangleIcon(state: it.sort),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        Text(
                          '231家',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                            fontWeight: .w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ScrollLoad(
                      color: 0x00000000,
                      list: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                      loadFn: () => debugPrint('1'),
                      renderItem: (item) {
                        return TaskItem(key: Key('$item'), type: 3);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
