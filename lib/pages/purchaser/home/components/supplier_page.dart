import 'package:flutter/material.dart';
import 'package:study/common/user/index.dart';
import 'package:study/pages/purchaser/components/page_tab.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<StatefulWidget> createState() => _SupplierPageState();
}

class _SupplierPageState extends State<StatefulWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<ListItem> tabList = [
    ListItem(
      title: '未提交审核',
      hot: true,
      hotNumber: 12,
      type: 'supplier',
      page: Text('1'),
    ),
    ListItem(
      title: '审核驳回',
      hot: false,
      hotNumber: 0,
      type: 'supplier',
      page: Text('2'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
      key: const Key('supplier_page'),
      child: _buildContent(),
      onVisibilityChanged: (info) {
        // 当可见面积 > 10% 且未加载时，触发请求
        // if (info.visibleFraction > 0.1 && !_isLoaded && !_isLoading) {
        //   _fetchData();
        // }
        debugPrint(info.toString());
      },
    );
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
