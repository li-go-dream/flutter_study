import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/components/page_bar.dart';
import 'package:study/pages/purchaser/components/detail_item.dart';
import 'package:study/pages/purchaser/components/detail_plane.dart';

class SupplierDetail extends StatelessWidget {
  final String id;
  const SupplierDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageBar(title: '供应商详情'),
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
                        spacing: 0,
                        content: [
                          Text(
                            '审核通过-启用',
                            style: TextStyle(
                              color: Color(0xFF00B42A),
                              fontSize: 14,
                              fontWeight: .w400,
                            ),
                          ),
                        ],
                        title: '供应商A名称超长的情况',
                      ),
                      DetailPlane(
                        content: [
                          DetailItem(label: '用户ID', value: '12312312312313'),
                          DetailItem(label: '门店编号', value: '123'),
                          DetailItem(
                            label: '注册时间',
                            value: '2025-09-30 14:32:32',
                          ),
                          DetailItem(
                            label: '入住时间',
                            value: '2025-09-30 14:32:32',
                          ),
                          DetailItem(label: '抽佣比例', value: '4%'),
                        ],
                        title: '系统信息',
                      ),
                      DetailPlane(
                        content: [
                          DetailItem(label: '联系人', value: '张三'),
                          DetailItem(label: '手机号', value: '13838384380'),
                          DetailItem(label: '邮箱', value: 'chifan@hh.com'),
                          DetailItem(label: '省市区', value: '四川省-成都市-高新区'),
                          DetailItem(
                            label: '详细地址',
                            value: '详细地址可能会比较长的时候会换行显示就是现在这样的',
                          ),
                        ],
                        title: '基础信息',
                      ),
                      DetailPlane(
                        content: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://5b0988e595225.cdn.sohucs.com/images/20200326/9efff1fb92044df1a6ae968be46eb9cc.jpeg',
                          ),
                          CachedNetworkImage(
                            imageUrl:
                                'https://5b0988e595225.cdn.sohucs.com/images/20200326/9efff1fb92044df1a6ae968be46eb9cc.jpeg',
                          ),
                        ],
                        title: '营业执照',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFDDDDDD), width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFFE2F3F0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.push('/purchaser/supplierManagement/edit/123');
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 12,
                        ),
                        child: Text(
                          '编辑',
                          style: TextStyle(
                            color: Color(0xFF27C1A5),
                            fontSize: 14,
                            fontWeight: .w400,
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
