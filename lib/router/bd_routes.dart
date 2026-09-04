import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/pages/bd/customer/index.dart';
import 'package:study/pages/bd/my/index.dart';
import 'package:study/pages/bd/task/index.dart';

List<RouteBase> get bdRoutes {
  return [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/bd/home',
              builder: (context, state) => BdTaskPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/bd/customer',
              builder: (context, state) => BdCustomerPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/bd/my', builder: (context, state) => BdMyPage()),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: SafeArea(top: false, child: navigationShell),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: navigationShell.currentIndex,
            onTap: (index) {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            },
            iconSize: 24.0,
            selectedFontSize: 12.0,
            selectedLabelStyle: TextStyle(fontWeight: .w500),
            unselectedLabelStyle: TextStyle(fontWeight: .w500),
            selectedItemColor: Color(0xFF3D7EFF),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/task-line-icon.png',
                  width: 24.0,
                  height: 24.0,
                ),
                activeIcon: Image.asset(
                  'assets/images/task-blue-icon.png',
                  width: 24.0,
                  height: 24.0,
                ),
                label: '任务',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/user-groups-icon.png',
                  width: 24.0,
                  height: 24.0,
                ),
                activeIcon: Image.asset(
                  'assets/images/user-groups-blue-icon.png',
                  width: 24.0,
                  height: 24.0,
                ),
                label: '客户',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/user-icon.png',
                  width: 24.0,
                  height: 24.0,
                ),
                activeIcon: Image.asset(
                  'assets/images/user-blue-icon.png',
                  width: 24.0,
                  height: 24.0,
                ),
                label: '我的',
              ),
            ],
          ),
        );
      },
    ),
  ];
}
