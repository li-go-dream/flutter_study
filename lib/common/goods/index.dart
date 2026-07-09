import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class Goods {
  final String id;
  final String name;
  final String desc;
  final double price;
  final int sales;
  final int inventory;
  final String imageUrl;
  final bool isUp;

  // 如果 JSON 中的字段名与 Dart 中的不同，使用 @JsonKey 注解映射
  // @JsonKey(name: 'email_address')
  // final String email;

  const Goods({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.sales,
    required this.inventory,
    required this.imageUrl,
    required this.isUp,
    // required this.email,
  });

  // 声明 fromJson 工厂方法，连接到生成的 _$UserFromJson 函数
  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

  // 声明 toJson 方法，连接到生成的 _$UserToJson 函数
  Map<String, dynamic> toJson() => _$GoodsToJson(this);

  // 可选：从 JSON 创建实例（如果后端返回的是 JSON）
  // factory Goods.fromJson(Map<String, dynamic> json) {
  //   return Goods(
  //     id: json['id'] as String,
  //     name: json['name'] as String,
  //     desc: json['desc'] as String,
  //     price: (json['price'] as num).toDouble(),
  //     sales: (json['sales'] as num).toInt(),
  //     inventory: (json['inventory'] as num).toInt(),
  //     imageUrl: json['imageUrl'] as String,
  //   );
  // }
}
