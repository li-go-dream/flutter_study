import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/pages/bd/home/index.dart';
import 'package:study/pages/bd/index.dart';
import 'package:study/pages/bd/workBench/index.dart';
import 'package:study/pages/chooseRole/index.dart';
import 'package:study/pages/login/index.dart';
import 'package:study/pages/main/index.dart';
import 'package:study/pages/purchaser/home/index.dart';
import 'package:study/pages/purchaser/index.dart';
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
    GoRoute(
      path: '/purchaser',
      builder: (context, state) => PurchaserPage(),
      routes: [
        GoRoute(
          path: '/purchaser/home',
          builder: (context, state) => PurchaserHomePage(),
        ),
        GoRoute(
          path: '/purchaser/workBench',
          builder: (context, state) => PurchaserWorkBenchPage(),
        ),
      ],
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
