import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:study/components/page_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:coordtransform_dart/coordtransform_dart.dart';

class ChooseAddress extends StatefulWidget {
  final String title;
  const ChooseAddress({super.key, this.title = '选择地址'});
  @override
  State<ChooseAddress> createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {
  late WebViewController controller;
  String isLoad = '定位中...';
  List<double> positionData = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initPermisssion();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  // 初始化权限并加载地图
  Future<void> initPermisssion() async {
    controller = WebViewController();
    await Permission.location.request();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    // controller.loadFlutterAsset('assets/html/map/index.html');
    controller.loadRequest(Uri.parse('http://192.168.1.6:5173/'));
    controller.addJavaScriptChannel(
      'FlutterChannel',
      onMessageReceived: (JavaScriptMessage message) {
        final jsonData = jsonDecode(message.message);
        handleClick(jsonData);
      },
    );
    controller.setNavigationDelegate(
      NavigationDelegate(
        onWebResourceError: (error) {
          debugPrint(error.toString());
        },
        onPageFinished: (url) {
          controller.runJavaScript("window.isEnv = 'flutter'");
        },
      ),
    );
    getLocation();
  }

  void handleClick(dynamic item) {
    switch (item['flutterType']) {
      case 'loaded': // 加载地图完成
        runJS();
        break;
      case 'chooseAddress': //选择地址时
        context.pop(item['data']);
        break;
      case 'leavePage': //选择地址时
        context.pop();
        break;
      default:
    }
  }

  void runJS() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      if (positionData.isNotEmpty) {
        controller.runJavaScript(
          "mapAddMarker(${positionData[0]}, ${positionData[1]})",
        );
        t.cancel();
      }
    });
  }

  // 获取当前定位
  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // 手机定位服务关闭
      await Geolocator.openAppSettings();
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return;
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

      final outLngLat = CoordinateTransformUtil.wgs84ToGcj02(
        position.longitude,
        position.latitude,
      );
      positionData = [outLngLat[0], outLngLat[1]];
      setState(() {
        isLoad = widget.title;
      });
    } catch (e) {
      debugPrint("定位失败:");
    }
    // print("手机定位服务开始2${position}");
    // // print(position.latitude);
    // // print(position.longitude);
    // print('111');
    // print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PageBar(title: isLoad),
      body: WebViewWidget(controller: controller),
    );
  }
}
