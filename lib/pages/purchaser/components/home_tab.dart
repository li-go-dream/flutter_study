import 'package:flutter/material.dart';
import 'package:study/common/user/index.dart';

class HomeTab extends StatelessWidget {
  final List<ListItem> list;
  const HomeTab({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(),
      length: list.length,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xFF27C1A5)),
            child: TabBar(
              // physics: const NeverScrollableScrollPhysics(), // 禁用滑动
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
              indicator: BoxDecoration(),
              dividerHeight: 0,
              labelPadding: EdgeInsets.zero,
              labelStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: .w600,
                color: Colors.white,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: .w400,
                color: Color.fromRGBO(255, 255, 255, 0.71),
              ),
              tabs: list
                  .map(
                    (item) => Tab(
                      child: Stack(
                        clipBehavior: .none,
                        children: [
                          Text(item.title),
                          if (item.hot)
                            Positioned(
                              top: 0,
                              right: -2,
                              child: Badge(backgroundColor: Color(0xFFE34D59)),
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
              physics: const NeverScrollableScrollPhysics(),
              children: list.map((it) => it.page).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
