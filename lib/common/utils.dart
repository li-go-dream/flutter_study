import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

void makingCall(String tel) async {
  final Uri launchUri = Uri(scheme: 'tel', path: tel);
  launchUrl(launchUri);
}

// 获取当前定位
Future<({bool result, Position? position})> getLocation() async {
  await Permission.location.request();
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    // 手机定位服务关闭
    await Geolocator.openAppSettings();
    return (result: false, position: null);
  }
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever) {
    return (result: false, position: null);
  }
  try {
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
        forceLocationManager: true,
        timeLimit: Duration(seconds: 20),
      ),
    );
    return (result: true, position: position);
  } catch (e) {
    return (result: false, position: null);
  }
}
