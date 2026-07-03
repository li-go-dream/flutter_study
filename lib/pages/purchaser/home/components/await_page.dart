import 'package:flutter/material.dart';
import 'package:study/common/user/index.dart';
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
      page: Text('1'),
    ),
    ListItem(
      title: '商品审核',
      hot: false,
      hotNumber: 0,
      type: 'await',
      page: Text('2'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(key: const Key('await_page'), child: _buildContent(),onVisibilityChanged: (info) {
        // 当可见面积 > 10% 且未加载时，触发请求
        // if (info.visibleFraction > 0.1 && !_isLoaded && !_isLoading) {
        //   _fetchData();
        // }
        debugPrint(info.toString());
      },);
    
  }

  Widget _buildContent() {
    return PageTab(list: tabList);
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
    
  }
}
}
