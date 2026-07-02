import 'package:flutter/material.dart';
import 'package:study/common/user/index.dart';

class HomeTab extends StatelessWidget {
  final List<ListItem> list;
  const HomeTab({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          TabBar(
            indicator: BoxDecoration(),
            dividerHeight: 0,
            tabs: list
                .map(
                  (item) => Tab(
                    child: Stack(
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: .w400,
                            color: Color.fromRGBO(255, 255, 255, 0.71),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: item.hot
                              ? Badge()
                              : Badge(backgroundColor: Colors.transparent),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
