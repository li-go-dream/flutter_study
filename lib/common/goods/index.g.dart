// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goods _$GoodsFromJson(Map<String, dynamic> json) => Goods(
  id: json['id'] as String,
  name: json['name'] as String,
  desc: json['desc'] as String,
  price: (json['price'] as num).toDouble(),
  sales: (json['sales'] as num).toInt(),
  inventory: (json['inventory'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  isUp: json['isUp'] as bool,
);

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'desc': instance.desc,
  'price': instance.price,
  'sales': instance.sales,
  'inventory': instance.inventory,
  'imageUrl': instance.imageUrl,
  'isUp': instance.isUp,
};
