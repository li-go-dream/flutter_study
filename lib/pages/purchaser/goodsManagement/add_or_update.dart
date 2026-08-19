import 'package:flutter/material.dart';
import 'package:study/common/input/index.dart';
import 'package:study/components/image_upload.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/purchaser/components/detail_item.dart';
import 'package:study/pages/purchaser/components/detail_plane.dart';

class AddOrUpdate extends StatefulWidget {
  final String? id;
  const AddOrUpdate({super.key, this.id});

  @override
  State<AddOrUpdate> createState() => _AddOrUpdateState();
}

class _AddOrUpdateState extends State<AddOrUpdate> {
  int goodsType = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageBar(
        title: (widget.id?.isNotEmpty ?? false) ? '修改商品' : '新建商品',
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xFFF5F6FA),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DetailPlane(
                        title: '基础信息',
                        content: [
                          DetailItem(
                            label: '商品名称',
                            isshow: false,
                            isRow: false,
                            content: SizedBox(
                              width: .maxFinite,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入商品名称',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DetailItem(
                            label: '件单价',
                            isshow: false,
                            content: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('11');
                                },
                                child: Row(
                                  mainAxisAlignment: .end,
                                  children: [
                                    Text(
                                      '请选择供应商',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w400,
                                        color: Color(0xFFBDBDBD),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFFBDBDBD),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          DetailItem(
                            label: '件单价',
                            isshow: false,
                            content: Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('11');
                                },
                                child: Row(
                                  mainAxisAlignment: .end,
                                  children: [
                                    Text(
                                      '请选择商品分类',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w400,
                                        color: Color(0xFFBDBDBD),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Color(0xFFBDBDBD),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          DetailItem(
                            label: '商品主图',
                            isshow: false,
                            isRow: false,
                            content: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: ImageUpload(),
                            ),
                          ),
                          DetailItem(
                            label: '商品主图(最多9)',
                            isshow: false,
                            isRow: false,
                            content: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: ImageUpload(limit: 9),
                            ),
                          ),
                        ],
                      ),
                      DetailPlane(
                        title: '价格信息',
                        content: [
                          DetailItem(
                            label: '计价单位',
                            isshow: false,
                            isRow: false,
                            content: Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Row(
                                spacing: 8,
                                children: [
                                  Flexible(
                                    fit: .tight,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          goodsType = 1;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: goodsType == 1
                                              ? Color(0xFFF3FFFB)
                                              : Color(0xFFF7F8FA),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: goodsType == 1
                                                ? Color(0xFF27C1A5)
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              '斤',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w500,
                                                color: goodsType == 1
                                                    ? Color(0xFF27C1A5)
                                                    : Color(0xFF1D2129),
                                              ),
                                            ),
                                            Text(
                                              '按实际斤数计价',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w400,
                                                color: Color(0xFFBDBDBD),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    fit: .tight,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          goodsType = 2;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: goodsType == 2
                                              ? Color(0xFFF3FFFB)
                                              : Color(0xFFF7F8FA),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: goodsType == 2
                                                ? Color(0xFF27C1A5)
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              '件',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w500,
                                                color: goodsType == 2
                                                    ? Color(0xFF27C1A5)
                                                    : Color(0xFF1D2129),
                                              ),
                                            ),
                                            Text(
                                              '按件数计价',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: .w400,
                                                color: Color(0xFFBDBDBD),
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
                          ),
                          DetailItem(
                            label: '件单价',
                            isshow: false,
                            unitText: '元/件',
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                ),
                                inputFormatters: [
                                  CallBackTextInputFormatter.price(),
                                ],
                              ),
                            ),
                          ),
                          DetailItem(
                            label: '斤单价',
                            isshow: false,
                            unitText: '元/斤',
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                ),
                                inputFormatters: [
                                  CallBackTextInputFormatter.price(),
                                ],
                              ),
                            ),
                          ),
                          DetailItem(
                            label: '抽佣比例',
                            isshow: false,
                            unitText: '%',
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                ),
                                inputFormatters: [
                                  CallBackTextInputFormatter.price(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFE7E7E7))),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFE2F3F0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                          onTap: () => Navigator.of(context).pop(false),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Center(
                              child: const Text(
                                '取消',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF27C1A5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF27C1A5),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Center(
                              child: const Text(
                                '确认',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
