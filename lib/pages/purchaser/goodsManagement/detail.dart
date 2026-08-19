import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:study/pages/purchaser/components/detail_item.dart';
import 'package:study/pages/purchaser/components/detail_plane.dart';

class GoodsDetail extends StatefulWidget {
  final String id;
  final List<String> imageList = [
    'https://img01.yzcdn.cn/upload_files/2026/06/15/Fu17N--SVDigjx2LxnUyqiaiMwPU.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
    'https://img01.yzcdn.cn/upload_files/2021/02/03/FjYXkrOSbr1_19xqdO1dd3-jFjwq.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
    'https://img01.yzcdn.cn/upload_files/2026/03/26/FkfGUWRXGN6RVXkaMMmvyPDAWvyk.jpg?imageView2/2/w/750/h/0/q/75/format/jpg',
  ];
  GoodsDetail({super.key, required this.id});

  @override
  State<GoodsDetail> createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  int currentIndex = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF5F6FA),
      backgroundColor: Colors.white,
      floatingActionButton: InkWell(
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.40),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(child: const Icon(Icons.arrow_back_ios_new, size: 16)),
        ),
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            FlutterExitApp.exitApp();
            // 无上一级，可执行退出应用或跳转首页
          }
        },
      ),
      floatingActionButtonLocation: .startTop,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFF5F6FA)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                              return Stack(
                                children: [
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      height: 375,
                                      autoPlay: true, // 自动播放
                                      // aspectRatio: 16 / 9,
                                      enableInfiniteScroll: true, // 无限循环
                                      viewportFraction: 1, // 每页可见比例
                                      autoPlayInterval: Duration(seconds: 5),
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          currentIndex = index + 1;
                                        });
                                      },
                                    ),
                                    items: widget.imageList
                                        .map(
                                          (item) => Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                      item,
                                                    ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Positioned(
                                    left: constraints.maxWidth * 0.5,
                                    bottom: 10,
                                    child: FractionalTranslation(
                                      translation: const Offset(-0.5, 0),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withValues(
                                            alpha: 0.4,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Text(
                                          '$currentIndex/${widget.imageList.length}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: .w400,
                                            color: Color.fromRGBO(
                                              0,
                                              0,
                                              0,
                                              0.60,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: .maxFinite,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                '已上架',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: .w600,
                                  color: Color(0xFF1D2129),
                                ),
                              ),
                            ),
                            DetailPlane(
                              title: '基础信息',
                              content: [
                                DetailItem(
                                  label: '商品名称',
                                  value:
                                      '这里是商品的名称超长的话就换行展示最多两行超过多两行超过多两行超过这里是商品的名称超长的话就换行展示最多两行超过多两行超过多两行超过这里是商品的名称超长的话就换行展示最多两行超过多两行超过多两行超过',
                                ),
                                DetailItem(label: '供应商', value: '供应商名称在这里'),
                                DetailItem(
                                  label: '商品分类',
                                  value: '一级分类/二级分类/三级分类',
                                ),
                                DetailItem(
                                  label: '商品条码',
                                  value: '77987979887987',
                                ),
                              ],
                            ),
                            DetailPlane(
                              title: '价格信息',
                              content: [
                                DetailItem(label: '计价单位', value: '件'),
                                DetailItem(label: '件单价', value: '20元/件'),
                                DetailItem(label: '抽佣比例', value: '3%'),
                              ],
                            ),
                            DetailPlane(
                              title: '规格库存',
                              content: [
                                DetailItem(label: '可售库存', value: '213件'),
                                DetailItem(label: '商品净重', value: '12斤'),
                                DetailItem(label: '商品毛重', value: '13斤'),
                              ],
                            ),
                            DetailPlane(
                              title: '运配信息',
                              content: [
                                DetailItem(label: '发货方式', value: '直通'),
                                DetailItem(label: '商品运费', value: '20元'),
                              ],
                            ),
                            DetailPlane(
                              title: '商品信息',
                              content: [
                                DetailItem(label: '产地', value: '驻马店'),
                                DetailItem(label: '等级', value: 'A'),
                                DetailItem(label: '大小', value: '大'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                mainAxisAlignment: .end,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                      child: Text(
                        '下架',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          color: Color(0xFF1D2129),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE2F3F0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 30,
                      ),
                      child: Text(
                        '编辑',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: .w400,
                          // color: Color(0xFF27C1A5),// 可点击
                          color: Color.fromRGBO(39, 193, 165, 0.30), // 不可点击
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
