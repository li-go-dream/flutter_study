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
      'img': AssetImage('assets/images/avatar-character.png'),
    },
    {
      'title': '采购经理',
      'desc': '品类商家实时掌握',
      'type': userRoleType['PURCHASER'],
      // 'show': () => userStore.roleType.includes(roleTypeMap.PURCHASER),
      'show': () => true,
      'img': AssetImage('assets/images/avatar-character-cg.png'),
    },
    {
      'title': '货车司机',
      'desc': '送货取货高效执行',
      'type': userRoleType['DRIVER'],
      'show': () => true,
      'img': AssetImage('assets/images/avatar-driver'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(children: [const Text('nihao1')]),
      ),
    );
  }
}
