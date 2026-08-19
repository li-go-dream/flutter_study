import 'package:flutter/material.dart';
import 'package:study/common/user/index.dart';
import 'package:study/components/scroll_load.dart';
import 'package:study/pages/purchaser/components/goods_item.dart';
import 'package:study/pages/purchaser/components/page_tab.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AwaitPage extends StatefulWidget {
  const AwaitPage({super.key});

  @override
  State<StatefulWidget> createState() => _AwaitPageState();
}

class _AwaitPageState extends State<StatefulWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<ListItem> tabList = [
    ListItem(
      title: '库存预警',
      hot: true,
      hotNumber: 12,
      type: 'await',
      page: const ListPage(),
    ),
    ListItem(
      title: '商品审核',
      hot: false,
      hotNumber: 0,
      type: 'await',
      page: const GoodsPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageTab(list: tabList);
  }

  // Widget _buildContent() {
  // if (_isLoading) {
  //   return const Center(child: CircularProgressIndicator());
  // }
  // if (_isLoaded && _data.isNotEmpty) {
  //   return ListView.builder(
  //     itemCount: _data.length,
  //     itemBuilder: (_, i) => ListTile(title: Text(_data[i])),
  //   );
  // }
  // // 未加载时也可以显示空白，但此处可放占位
  // return const Center(child: Text('等待加载...'));
  // }
}

// 库存预警
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool hasMore = true;
  bool loading = false;
  bool isloaded = false; // 是否加载过

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
      key: const Key('await_page_warn'),
      child: _buildContent(),
      onVisibilityChanged: (info) {
        // 当可见面积 > 10% 且未加载时，触发请求
        if (info.visibleFraction > 0.1 && !isloaded) {
          isloaded = true;
          debugPrint('预警加载中');
        }
      },
    );
  }

  Widget _buildContent() {
    return ScrollLoad(
      loading: loading,
      hasMore: loading,
      list: [1, 2, 3, 4],
      loadFn: () {},
      renderItem: (item) {
        return GoodsItem();
      },
    );
  }
}

// 商品审核
class GoodsPage extends StatefulWidget {
  const GoodsPage({super.key});

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool hasMore = true;
  bool loading = false;
  bool isloaded = false; // 是否加载过

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
      key: const Key('await_page_check'),
      child: _buildContent(),
      onVisibilityChanged: (info) {
        // 当可见面积 > 10% 且未加载时，触发请求
        if (info.visibleFraction > 0.1 && !isloaded) {
          isloaded = true;
          debugPrint('审核加载中');
        }
      },
    );
  }

  Widget _buildContent() {
    return ScrollLoad(
      loading: loading,
      hasMore: loading,
      list: [1, 2, 3],
      loadFn: () {},
      renderItem: (item) {
        return GoodsItem(operationType: '2');
      },
    );
  }
}
