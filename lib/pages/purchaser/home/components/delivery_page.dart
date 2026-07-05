import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<StatefulWidget> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<StatefulWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
      key: const Key('delivery_page'),
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
    return Text('发货');
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
