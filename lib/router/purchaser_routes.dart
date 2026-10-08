import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study/pages/purchaser/afterSalesManagement/detail.dart';
import 'package:study/pages/purchaser/afterSalesManagement/index.dart';
import 'package:study/pages/purchaser/goodsManagement/add_or_update.dart';
import 'package:study/pages/purchaser/goodsManagement/detail.dart';
import 'package:study/pages/purchaser/goodsManagement/index.dart';
import 'package:study/pages/purchaser/home/index.dart';
import 'package:study/pages/purchaser/orderManagement/detail.dart';
import 'package:study/pages/purchaser/supplierManagement/edit.dart';
import 'package:study/pages/purchaser/orderManagement/index.dart';
import 'package:study/pages/purchaser/supplierManagement/detail.dart';
import 'package:study/pages/purchaser/supplierManagement/index.dart';
import 'package:study/pages/purchaser/supplierManagement/register_supplier.dart';
import 'package:study/pages/purchaser/workBench/index.dart';

List<RouteBase> get purchaserRoutes {
  return [
    StatefulShellRoute.indexedStack(
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/purchaser/home',
              builder: (context, state) => const PurchaserHomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/purchaser/workBench',
              builder: (context, state) => const PurchaserWorkBenchPage(),
            ),
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
      path: '/purchaser/goodsManagement',
      builder: (context, state) => GoodsManagement(),
    ),
    GoRoute(
      path: '/purchaser/goodsManagement/goodDetail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return GoodsDetail(id: id);
      },
    ),
    GoRoute(
      path: '/purchaser/goodsManagement/addOrupdate(/:id)',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return AddOrUpdate(id: id);
      },
    ),
    GoRoute(
      path: '/purchaser/supplierManagement',
      builder: (context, state) => SupplierManagement(),
    ),
    GoRoute(
      path: '/purchaser/supplierManagement/register',
      builder: (context, state) => RegisterSupplier(),
    ),
    GoRoute(
      path: '/purchaser/supplierManagement/detail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return SupplierDetail(id: id);
      },
    ),
    GoRoute(
      path: '/purchaser/supplierManagement/edit/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return SupplierEdit(id: id);
      },
    ),
    GoRoute(
      path: '/purchaser/orderManagement',
      builder: (context, state) => OrderManagement(),
    ),
    GoRoute(
      path: '/purchaser/orderManagement/orderDetail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return OrderDetail(id: id);
      },
    ),
    GoRoute(
      path: '/purchaser/afterSalesManagement',
      builder: (context, state) => AfterSalesManagement(),
    ),
    GoRoute(
      path: '/purchaser/afterSalesManagement/afterDetail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return AfterSalesDetail(id: id);
      },
    ),
  ];
}
