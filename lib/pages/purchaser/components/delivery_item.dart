import 'package:flutter/material.dart';
import 'package:study/common/utils.dart';

class DeliveryItem extends StatelessWidget {
  const DeliveryItem({super.key});
  static const List<Map<String, String>> btnList = [
    {'title': '联系供应商', 'type': 'tel'},
    {'title': '订单详情', 'type': 'detail'},
  ];

  void handleOpertation(Map<String, String> it) {
    switch (it['type']) {
      case 'tel':
        makingCall('13086697391');
        break;
      case 'detail':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            '供应商名称',
            style: TextStyle(
              color: Color(0xFF1D2129),
              fontSize: 16,
              fontWeight: .w600,
            ),
            maxLines: 1,
            overflow: .ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '下单日期：2026-07-31',
            style: TextStyle(
              color: Color(0xFF1D2129),
              fontSize: 14,
              fontWeight: .w400,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          const Text(
                            '直送订单(件)',
                            style: TextStyle(
                              color: Color(0xFF1D2129),
                              fontSize: 14,
                              fontWeight: .w500,
                            ),
                          ),
                          Text(
                            '采购下单 35',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 14,
                              fontWeight: .w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          const Text(
                            '已发货 21',
                            style: TextStyle(
                              color: Color(0xFF27C1A5),
                              fontSize: 14,
                              fontWeight: .w400,
                            ),
                          ),
                          Text(
                            '未发货 15',
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 14,
                              fontWeight: .w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                              return Container(
                                width: .maxFinite,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC9CDD4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  clipBehavior: .none,
                                  children: [
                                    FractionallySizedBox(
                                      widthFactor: 0.4,
                                      child: Container(
                                        height: 8,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF93D5C9),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // top: -8,
                                      left: constraints.maxWidth * 0.4,
                                      child: FractionalTranslation(
                                        translation: Offset(-0.5, -0.3),
                                        child: IntrinsicWidth(
                                          child: Container(
                                            height: 20,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: const [
                                                // 加个阴影让它更明显
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 4,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              '40%',
                                              style: TextStyle(
                                                color: Color(0xFF1D2129),
                                                fontSize: 10,
                                                fontWeight: .w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            spacing: 8.0,
            children: btnList.map((it) {
              return Flexible(
                fit: .tight,
                child: InkWell(
                  onTap: () {
                    handleOpertation(it);
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
