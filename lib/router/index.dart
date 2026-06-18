import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/pages/chooseRole/index.dart';
import 'package:study/pages/login/index.dart';
import 'package:study/pages/main/index.dart';

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
  ],
);

// Map<String, Widget Function(BuildContext)> getRoutes() {
//   return {'/': (context) => MainPage(), '/login': (context) => LoginPage()};
// }
