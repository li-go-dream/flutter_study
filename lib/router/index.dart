import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/pages/chooseRole/index.dart';
import 'package:study/pages/login/index.dart';
import 'package:study/pages/main/index.dart';
import 'package:study/pages/map/chooseAddress/index.dart';
import 'package:study/router/driver_routes.dart';
import 'package:study/router/purchaser_routes.dart';
import 'package:study/router/bd_routes.dart';

Widget getAllRoutes() {
  // return MaterialApp(
  //   title: 'Flutter Demo',
  //   initialRoute: '/',
  // ).router(routerConfig: _router);
  return MaterialApp.router(
    routerConfig: _router,
    theme: ThemeData(
      // primarySwatch: Colors.blue,
      // 使用 TextSelectionTheme 设置光标颜色
      // textSelectionTheme: const TextSelectionThemeData(
      //   cursorColor: Colors.red, // 设置你想要的任何颜色
      //   selectionColor: Colors.red,
      //   selectionHandleColor: Colors.red,
      // ),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const MainPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/chooseRole', builder: (context, state) => ChooseRole()),
    GoRoute(
      name: 'chooseAddress',
      path: '/map/chooseAddress',
      builder: (context, state) {
        final title = state.uri.queryParameters['title'] ?? '';
        return ChooseAddress(title: title);
      },
    ),
    ...purchaserRoutes,
    ...driverRoutes,
    ...bdRoutes,
  ],
);

// Map<String, Widget Function(BuildContext)> getRoutes() {
//   return {'/': (context) => const MainPage(), '/login': (context) => const LoginPage()};
// }
