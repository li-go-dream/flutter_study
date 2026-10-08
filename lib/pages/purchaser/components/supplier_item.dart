import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/goods/index.dart';

class SupplierItem extends StatelessWidget {
  final Suppliers? item; // 0 待提交 1 待审核 2 审核驳回  3 启用 4 禁用
  final String operationType; // 0 待提交审核 2审核驳回
  const SupplierItem({super.key, this.item, this.operationType = '0'});
  static const List<Map<String, String>> btnList = [
    {'title': '提交入驻审核', 'type': 'submit'},
    {'title': '供应商详情', 'type': 'detail'},
  ];

  void handleOpertation(Map<String, String> item, BuildContext context) {
    switch (item['type']) {
      case 'submit':
        context.push('/purchaser/supplierManagement/edit/123');
        break;
      case 'detail':
        context.push('/purchaser/supplierManagement/detail/123');
        break;
      default:
    }
  }

  String statusToText() {
    late String name;
    switch (operationType) {
      case '0':
        name = '待提交';
        break;
      case '1':
        name = '待审核';
        break;
      case '2':
        name = '已驳回';
        break;
      case '3':
        name = '已启用';
        break;
      case '4':
        name = '已禁用';
        break;
      default:
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    String statusName = statusToText();
    return Container(
      margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text.rich(
                  maxLines: 1,
                  overflow: .ellipsis,
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: Color(0xFF27C1A5),
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: const Text(
                            '自',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: .w400,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '供应商名称供应商名称供应商名称供应商名称供应商名称供应商名称',
                        style: TextStyle(
                          color: Color(0xff1D2129),
                          fontSize: 14,
                          fontWeight: .w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              if (operationType == '3')
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFFE8FFEA),
                  ),
                  child: Text(
                    '已启用',
                    style: TextStyle(
                      color: Color(0xFF00B42A),
                      fontSize: 12,
                      fontWeight: .w400,
                    ),
                  ),
                )
              else
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFFFFECE8),
                  ),
                  child: Text(
                    statusName,
                    style: TextStyle(
                      color: Color(0xFFF53F3F),
                      fontSize: 12,
                      fontWeight: .w400,
                    ),
                  ),
                ),
            ],
          ),
          Text(
            '联系人 13900000000',
            style: TextStyle(
              color: Color(0xff999999),
              fontSize: 14,
              fontWeight: .w400,
            ),
          ),
          if (operationType == '0')
            const Text(
              '已注册，待提交审核',
              style: TextStyle(
                color: Color(0xffFF7D00),
                fontSize: 14,
                fontWeight: .w400,
              ),
            ),
          if (operationType == '2')
            const Text(
              '入驻审核驳回',
              style: TextStyle(
                color: Color(0xffF53F3F),
                fontSize: 14,
                fontWeight: .w400,
              ),
            ),
          if (operationType == '3')
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF7F8FA),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '2253253.21',
                          style: TextStyle(
                            color: Color(0xff27C1A5),
                            fontSize: 16,
                            fontWeight: .w600,
                          ),
                        ),
                        Text(
                          '今日销售额(元)',
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12,
                            fontWeight: .w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '66',
                          style: TextStyle(
                            color: Color(0xff27C1A5),
                            fontSize: 16,
                            fontWeight: .w600,
                          ),
                        ),
                        Text(
                          '今日销售件数',
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12,
                            fontWeight: .w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            color: Color(0xff27C1A5),
                            fontSize: 16,
                            fontWeight: .w600,
                          ),
                        ),
                        Text(
                          '未动销天数',
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 12,
                            fontWeight: .w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 8.0),
          Row(
            spacing: 8.0,
            children: btnList.map((it) {
              return Flexible(
                key: Key(it['type'] ?? ''),
                fit: .tight,
                child: InkWell(
                  onTap: () {
                    handleOpertation(it, context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Center(
                      child: Text(
                        it['title'] ?? "",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: .w400,
                          color: Color(0xFF1D2129),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
