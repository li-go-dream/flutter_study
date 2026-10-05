import 'dart:io';

class ImageItem {
  final File? locakurl;
  final String url;
  final String islocal;
  final String id;
  ImageItem({
    required this.url,
    required this.id,
    required this.islocal, // 1 本地文件 2 网络文件
    this.locakurl,
  });
  // ImageItem copyItem() {
  //   return ImageItem(
  //     url: url,
  //     id: id,
  //     islocal: islocal, // 1 本地文件 2 网络文件
  //     locakurl: locakurl, // 1 本地文件 2 网络文件
  //   );
  // }
}

class TabItem {
  final String id;
  final String name;
  final int number;

  TabItem({required this.id, required this.name, this.number = 0});
}

class OrderData {
  final String id;
  final String supplierName; // 供应商名称
  final String purchaserName; // 采购商名称
  final String goodsDesc; // 商品描述
  final int orderType; // 1 直通订单 2 直送订单
  final List<String> imgs; // 商品图片
  final String orderTime; // 订单时间
  final double prices; // 订单价格
  final int number; // 订单数量
  final int orderStatus; // 1 待付款 2待发货 3已发货 4 售后中 5已关闭

  const OrderData({
    required this.id,
    required this.supplierName, // 供应商名称
    required this.purchaserName, // 采购商名称
    required this.goodsDesc, // 商品描述
    required this.orderType, // 1 直通订单 2 直送订单
    required this.imgs, // 商品图片
    required this.orderTime, // 订单时间
    required this.prices, // 订单价格
    required this.number, // 订单数量
    required this.orderStatus, // 1 待付款 2待发货 3已发货 4 售后中 5已关闭
  });
}

class ShopInfo {
  final String shopName;
  final String user;
  final String tel;
  final String address;
  final double? lng;
  final double? lat;
  final double distance;

  ShopInfo({
    required this.shopName,
    required this.user,
    required this.tel,
    required this.address,
    this.lng,
    this.lat,
    required this.distance,
  });
}

class TaskItemData {
  final String id;
  final ShopInfo shopinfo;
  final int dirverType; // 1 取件 2 送货
  final int
  status; // dirverType-1 1 待取件 2 已取件 3 已完成 | dirverType-2 1 待发货 2 送货中 3 已送达
  final int type; // 1 取框 2 取货

  TaskItemData({
    required this.id,
    required this.shopinfo,
    required this.dirverType,
    required this.status,
    required this.type,
  });
}

class SelectDialogItem {
  final String id;
  final String name;

  SelectDialogItem({required this.id, required this.name});
}
