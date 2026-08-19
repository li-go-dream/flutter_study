import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:study/components/image_upload.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/purchaser/components/detail_item.dart';
import 'package:study/pages/purchaser/components/detail_plane.dart';

class SupplierEdit extends StatefulWidget {
  final String id;
  const SupplierEdit({super.key, required this.id});

  @override
  State<SupplierEdit> createState() => _SupplierEditState();
}

class _SupplierEditState extends State<SupplierEdit> {
  TextEditingController addressController = TextEditingController();
  Map<String, String> form = {
    'pname': '',
    'city': '',
    'adname': '',
    'address': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageBar(title: '供应商编辑'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(color: Color(0xFFF5F6FA)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DetailPlane(
                        content: [
                          DetailItem(
                            label: '供应商名称',
                            isshow: false,
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入供应商名称',
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
                            label: '联系人',
                            isshow: false,
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入联系人',
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
                            label: '手机号',
                            isshow: false,
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                keyboardType: TextInputType.number,
                                maxLength: 11,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入联系人号码',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                  counter: const SizedBox.shrink(),
                                ),
                              ),
                            ),
                          ),
                          DetailItem(
                            label: '邮箱',
                            isshow: false,
                            content: Expanded(
                              child: TextField(
                                textAlign: .right,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入邮箱',
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
                            label: '省市区',
                            isshow: false,
                            content: Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final Map? addressInfo = await context
                                      .pushNamed(
                                        'chooseAddress',
                                        queryParameters: {'title': '选择省市区'},
                                      );
                                  if (addressInfo != null) {
                                    setState(() {
                                      form = {
                                        'pname': addressInfo['pname'] ?? '',
                                        'city': addressInfo['cityname'] ?? '',
                                        'adname': addressInfo['adname'] ?? '',
                                        'address': addressInfo['address'] ?? '',
                                      };
                                    });
                                    addressController.text =
                                        addressInfo['address'] != ''
                                        ? '${addressInfo['address']}${addressInfo['name']}'
                                        : '';
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: .end,
                                  children: [
                                    Text(
                                      form['pname'] != ''
                                          ? '${form['pname']}-${form['city']}-${form['adname']}'
                                          : '请选择地区',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: .w400,
                                        color: form['pname'] != ''
                                            ? Colors.black87
                                            : Color(0xFFBDBDBD),
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
                            label: '详细地址',
                            isshow: false,
                            content: Expanded(
                              child: TextField(
                                controller: addressController,
                                textAlign: .right,
                                decoration: InputDecoration(
                                  border: .none,
                                  hintText: '请输入详细地址',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: .w400,
                                    color: Color(0xFFBDBDBD),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        title: '基础信息',
                      ),
                      DetailPlane(
                        content: [
                          Text(
                            '营业职照信息修改后需重新提起入驻审核',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: .w400,
                              color: Color(0xFFF53F3F),
                            ),
                          ),
                          ImageUpload(limit: 6),
                        ],
                        title: '营业执照',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFDDDDDD), width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFE2F3F0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 9),
                            child: const Text(
                              '取消',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .w400,
                                color: Color(0xFF27C1A5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF27C1A5),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 9),
                            child: const Text(
                              '提交审核',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: .w400,
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
          ],
        ),
      ),
    );
  }
}
