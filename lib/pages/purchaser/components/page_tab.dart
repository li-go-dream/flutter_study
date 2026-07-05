import 'package:flutter/material.dart';
import 'package:study/common/user/index.dart';

class PageTab extends StatefulWidget {
  final List<ListItem> list;
  const PageTab({super.key, required this.list});

  @override
  State<PageTab> createState() => _PageTabState();
}

class _PageTabState extends State<PageTab> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  // 封装初始化控制器的方法
  void _initController() {
    final length = widget.list.length;
    // 如果列表为空，避免创建 length=0 的控制器（报错）
    if (length == 0) {
      // 创建临时控制器，但不会实际使用（会在 build 中提前返回）
      _controller = TabController(length: 1, vsync: this);
      return;
    }
    _controller = TabController(length: length, vsync: this);
    _controller.addListener(() {
      if (!_controller.indexIsChanging) {
        setState(() {
          _currentIndex = _controller.index;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF27C1A5),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                _currentIndex == 0
                    ? 'assets/images/tab-left.png'
                    : 'assets/images/tab-right.png',
              ),
            ),
          ),
          child: TabBar(
            controller: _controller,
            padding: EdgeInsets.symmetric(horizontal: 0),
            overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
            indicator: BoxDecoration(
              color: Color(0xFF2FC3A8),
              borderRadius: BorderRadius.circular(2),
            ),
            indicatorWeight: 3.0,
            indicatorPadding: const EdgeInsets.only(
              top: 47,
              left: 16,
              right: 16,
            ),
            dividerHeight: 0,
            labelPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: .w600,
              color: Color(0xFF2FC3A8),
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: .w400,
              color: Color(0xFF1D2129),
            ),
            tabs: widget.list
                .map(
                  (item) => Tab(
                    child: Stack(
                      clipBehavior: .none,
                      children: [
                        Text(item.title),
                        if (item.hot)
                          Positioned(
                            top: -10,
                            right: -20,
                            child: Badge(
                              backgroundColor: Color(0xFFE34D59),
                              label: Text(
                                (item.hotNumber ?? 0) > 99
                                    ? '99+'
                                    : '${item.hotNumber}',
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: widget.list.map((it) => it.page).toList(),
          ),
        ),
      ],
    );
  }
}
