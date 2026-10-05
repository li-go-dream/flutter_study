import 'package:flutter/material.dart';
import 'package:study/common/data/index.dart';

class CommonTab extends StatefulWidget {
  final List<TabItem> list;

  final ValueChanged<int> tabChange;

  final int initTab;

  final bool isScrollable;
  final int indicatorColor;
  final int labelColor;
  final bool hasBottomBorder;
  final TextStyle? labelStyle;
  final TextStyle? selectlabelstyle;
  final BoxDecoration? decoration;

  const CommonTab({
    super.key,
    required this.list,
    required this.tabChange,
    this.initTab = 0,
    this.isScrollable = false,
    this.hasBottomBorder = true,
    this.indicatorColor = 0xFF2FC3A8,
    this.labelColor = 0xFF27C1A5,
    this.labelStyle,
    this.selectlabelstyle,
    this.decoration,
  });

  @override
  State<CommonTab> createState() => _CommonTabState();
}

class _CommonTabState extends State<CommonTab>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    currentIndex = _safeIndex(widget.initTab);

    _createController();
  }

  /// 创建TabController
  void _createController() {
    if (widget.list.isEmpty) {
      _controller = null;

      return;
    }

    _controller = TabController(
      length: widget.list.length,

      initialIndex: currentIndex,

      vsync: this,
    );

    _controller!.addListener(_onTabChange);
  }

  /// Tab切换监听
  void _onTabChange() {
    if (_controller == null) {
      return;
    }

    if (!_controller!.indexIsChanging) {
      final index = _controller!.index;

      if (index != currentIndex) {
        setState(() {
          currentIndex = index;
        });

        widget.tabChange(index);
      }
    }
  }

  /// 处理列表变化
  @override
  void didUpdateWidget(covariant CommonTab oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.list.length != widget.list.length) {
      _controller?.removeListener(_onTabChange);

      _controller?.dispose();

      currentIndex = _safeIndex(currentIndex);

      _createController();

      setState(() {});
    }
  }

  int _safeIndex(int index) {
    if (widget.list.isEmpty) {
      return 0;
    }

    if (index >= widget.list.length) {
      return widget.list.length - 1;
    }

    if (index < 0) {
      return 0;
    }

    return index;
  }

  @override
  void dispose() {
    _controller?.removeListener(_onTabChange);

    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.list.isEmpty || _controller == null) {
      return const SizedBox();
    }

    return Container(
      decoration:
          widget.decoration ??
          BoxDecoration(
            border: widget.hasBottomBorder
                ? Border(bottom: BorderSide(width: 1, color: Color(0xFFF2F3F5)))
                : Border(),
          ),

      child: TabBar(
        controller: _controller,
        tabAlignment: widget.isScrollable ? TabAlignment.start : null,
        isScrollable: widget.isScrollable,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: Color(widget.indicatorColor)),
          borderRadius: BorderRadius.all(Radius.circular(2)),
          insets: EdgeInsets.symmetric(horizontal: 16),
        ),
        // indicatorSize: TabBarIndicatorSize.label,
        dividerHeight: 0,
        labelPadding: EdgeInsets.zero,
        labelStyle:
            widget.selectlabelstyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(widget.labelColor),
            ),
        unselectedLabelStyle:
            widget.labelStyle ??
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF666666),
            ),
        tabs: widget.list.map(_buildTab).toList(),
      ),
    );
  }

  Tab _buildTab(TabItem item) {
    final text = item.number == null || item.number == 0
        ? item.name
        : '${item.name}${item.number}';

    Widget child = Text(text);

    if (widget.isScrollable) {
      child = Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),

        child: child,
      );
    }

    return Tab(key: ValueKey(item.id), child: child);
  }
}
