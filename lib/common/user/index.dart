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
Map<String, String> userRoleType = {
  /**bd */
  'BD': 'bd',
  /**采购 */
  'PURCHASER': 'purchaser',
  // 货车司机
  'DRIVER': 'driver',
};
