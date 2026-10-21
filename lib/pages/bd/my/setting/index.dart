import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/components/page_bar.dart';

class BdMySetting extends StatelessWidget {
  const BdMySetting({super.key});
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
                  onTap: () {},
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
                    final location = GoRouterState.of(context).matchedLocation;
                    if (location == '/chooseRole') return;
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
