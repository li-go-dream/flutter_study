import 'package:go_router/go_router.dart';
import 'package:study/pages/driver/deliveryList/index.dart';
import 'package:study/pages/driver/deliveryTask/index.dart';
import 'package:study/pages/driver/index.dart';
import 'package:study/pages/driver/pickUpList/index.dart';
import 'package:study/pages/driver/pickUpTask/index.dart';

List<RouteBase> get driverRoutes {
  return [
    GoRoute(path: '/driver/home', builder: (context, state) => DriverPage()),
    GoRoute(
      path: '/driver/pickuptask',
      builder: (context, state) => PickUpTask(),
    ),
    GoRoute(
      path: '/driver/pickupList/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return PickUpList(id: id);
      },
    ),
    GoRoute(
      path: '/driver/deliverytask',
      builder: (context, state) => DeliveryTask(),
    ),
    GoRoute(
      path: '/driver/deliveryList/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return DeliveryList(id: id);
      },
    ),
  ];
}
