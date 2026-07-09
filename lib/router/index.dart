import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/pages/bd/home/index.dart';
import 'package:study/pages/bd/index.dart';
import 'package:study/pages/bd/workBench/index.dart';
import 'package:study/pages/chooseRole/index.dart';
import 'package:study/pages/login/index.dart';
import 'package:study/pages/main/index.dart';
import 'package:study/pages/purchaser/home/index.dart';
import 'package:study/pages/purchaser/workBench/index.dart';

Widget getAllRoutes() {
  // return MaterialApp(
  //   title: 'Flutter Demo',
  //   initialRoute: '/',
  // ).router(routerConfig: _router);
  return MaterialApp.router(routerConfig: _router);
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/', builder: (context, state) => MainPage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/chooseRole', builder: (context, state) => ChooseRole()),
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/purchaser/home',
              builder: (context, state) => PurchaserHomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/purchaser/workBench',
              builder: (context, state) => PurchaserWorkBenchPage(),
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
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
            selectedItemColor: Color(0xFF27C1A5),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/pur-home-line.png',
                  width: 24.0,
                  height: 24.0,
                ),
                activeIcon: Image.asset(
                  'assets/images/pur-home-fill.png',
                  width: 24.0,
                  height: 24.0,
                ),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/pur-work-line.png',
                  width: 24.0,
                  height: 24.0,
                ),
                activeIcon: Image.asset(
                  'assets/images/pur-work-fill.png',
                  width: 24.0,
                  height: 24.0,
                ),
                label: '工作台',
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: '/bd',
      builder: (context, state) => BdPage(),
      routes: [
        GoRoute(path: '/bd/home', builder: (context, state) => BdHomePage()),
        GoRoute(
          path: '/bd/workBench',
          builder: (context, state) => BdWorkBenchPage(),
        ),
      ],
    ),
  ],
);

// Map<String, Widget Function(BuildContext)> getRoutes() {
//   return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
// }
