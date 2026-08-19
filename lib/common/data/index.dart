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

  TabItem({required this.id, required this.name, required this.number});
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
