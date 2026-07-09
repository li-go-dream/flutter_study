// enum RoleType {
//   bd, // bd
//   purchaser, // 采购
//   driver, // 货车司机
// }

// extension RoleTypeExtension on RoleType {
//   String get value {
//     switch (this) {
//       case RoleType.bd:
//         return 'bd';
//       case RoleType.purchaser:
//         return 'purchaser';
//       case RoleType.driver:
//         return 'driver';
//     }
//   }
// }

// 用户角色类型
import 'package:flutter/material.dart';

Map<String, String> userRoleType = {
  /**bd */
  'BD': 'bd',
  /**采购 */
  'PURCHASER': 'purchaser',
  // 货车司机
  'DRIVER': 'driver',
};

class ListItem {
  final String title;
  final String type;
  final bool hot;
  final int? hotNumber;
  final Widget page;
  ListItem({
    required this.title,
    required this.type,
    required this.hot,
    required this.page,
    this.hotNumber,
  });
}

class WorkBenchItem {
  final String title;
  final String desc;
  final String img;
  final String url;
  final Color color;
  final double imgWidth;
  final double imgHeight;
  WorkBenchItem({
    required this.title,
    required this.desc,
    required this.img,
    required this.color,
    required this.url,
    this.imgWidth = 24.0,
    this.imgHeight = 24.0,
  });
}
