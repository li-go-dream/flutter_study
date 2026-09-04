import 'package:flutter/material.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/components/search_input.dart';
import 'package:study/pages/driver/components/pick_up_goods.dart';
import 'package:study/pages/driver/components/revolve_box.dart';

class PickUpList extends StatefulWidget {
  final String id;
  const PickUpList({super.key, required this.id});

  @override
  State<PickUpList> createState() => _PickUpListState();
}

class _PickUpListState extends State<PickUpList> {
  @override
  void initState() {
    super.initState();
    debugPrint(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageBar(title: '取件清单'),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        '李四果蔬店芜湖分店',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: .w600,
                          color: Color(0xFF1D2129),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 14,
                            color: Color(0xFF999999),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '13054462151',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .w400,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Color(0xFF999999),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '成都市高新区天府四街199号',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .w400,
                              color: Color(0xFF999999),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF7E8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '本单取件数',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: .w400,
                            color: Color(0xFF1D2129),
                          ),
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: .w500,
                            color: Color(0xFFFF7D00),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF2F3F5),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SearchInput(
                btncolor: 0xFFFF7D00,
                color: Colors.white,
                valueChange: () {},
                placeholder: '请输入关键词进行搜索',
              ),
            ),
            Expanded(
              child: Container(
                width: .maxFinite,
                decoration: BoxDecoration(color: Color(0xFFF2F3F5)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        // RevolveBox(onlyReady: true),
                        PickUpGoods(onlyReady: true),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                        // PickUpGoods(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5, color: Color(0xFFDDDDDD)),
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFFF7D00),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '取件完成',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: .w400,
                      color: Colors.white,
                    ),
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
