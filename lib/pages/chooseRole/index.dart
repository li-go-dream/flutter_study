// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/common/user/index.dart';

class ChooseRole extends StatelessWidget {
  ChooseRole({super.key});

  final loginRoleOptions = [
    {
      'title': 'BD经理',
      'desc': '客勤拜访精准洞悉',
      'type': userRoleType['BD'],
      'show': () => true,
      'img': 'assets/images/avatar-character.png',
    },
    {
      'title': '采购经理',
      'desc': '品类商家实时掌握',
      'type': userRoleType['PURCHASER'],
      // 'show': () => userStore.roleType.includes(roleTypeMap.PURCHASER),
      'show': () => true,
      'img': 'assets/images/avatar-character-cg.png',
    },
    {
      'title': '货车司机',
      'desc': '送货取货高效执行',
      'type': userRoleType['DRIVER'],
      'show': () => true,
      'img': 'assets/images/avatar-driver.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse('FFF8F8F8', radix: 16)),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop(),
        ),
        toolbarHeight: 44.0,
        title: Text(
          '请选择你的角色',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(int.parse('FF1D2129', radix: 16)),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: loginRoleOptions
              .where((item) {
                final showFunc = item['show'];
                return showFunc is bool Function() && showFunc();
              })
              .map<Widget>((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 14.0,
                      ),
                      side: BorderSide.none,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      debugPrint(item['type'] as String);
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          item['img'] as String,
                          width: 90.0,
                          height: 90.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  item['desc'] as String,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(
                                      int.parse('FF999999', radix: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/blue-right.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                      ],
                    ),
                  ),
                );
              })
              .toList(),
        ),
      ),
    );
  }
}
