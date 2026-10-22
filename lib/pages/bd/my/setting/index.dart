import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/dialog/index.dart';
import 'package:study/components/custom_alert.dart';
import 'package:study/components/page_bar.dart';

class BdMySetting extends StatelessWidget {
  const BdMySetting({super.key});

  void handleLoginOut(BuildContext context) {
    customDialog(
      context,
      DialogPar(
        content: '确定退出登录？',
        cancelText: '取消',
        okText: '确定',
        okColor: 0Xff3D7EFF,
      ),
      (destory, val) {
        destory(val);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: PageBar(title: '设置'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                GestureDetector(
                  behavior: .opaque,
                  onTap: () {
                    handleLoginOut(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          '退出登录',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: .w400,
                            color: Color.fromRGBO(0, 0, 0, 0.90),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFFBDBDBD),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.5,
                  decoration: BoxDecoration(color: Color(0xFFE7E7E7)),
                ),
                GestureDetector(
                  behavior: .opaque,
                  onTap: () {
                    context.push('/chooseRole');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          '切换角色',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: .w400,
                            color: Color.fromRGBO(0, 0, 0, 0.90),
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color(0xFFBDBDBD),
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
