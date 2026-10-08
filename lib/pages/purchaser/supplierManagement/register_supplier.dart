import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:study/components/page_bar.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterSupplier extends StatefulWidget {
  const RegisterSupplier({super.key});

  @override
  State<RegisterSupplier> createState() => _RegisterSupplierState();
}

class _RegisterSupplierState extends State<RegisterSupplier> {
  late QrImage _qrImage;
  final GlobalKey qrKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    final qrcode = QrCode.fromData(
      data: 'https://www.baidu.com',
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    _qrImage = QrImage(qrcode);
  }

  void saveImage() async {
    // await Permission.photos.request();
    await Permission.storage.request();

    RenderRepaintBoundary boundary =
        qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3);

    ByteData? data = await image.toByteData(format: ui.ImageByteFormat.png);

    if (data == null) {
      Fluttertoast.showToast(msg: "导出图片失败", gravity: ToastGravity.CENTER);
      return;
    }

    await ImageGallerySaverPlus.saveImage(
      data.buffer.asUint8List(),
      quality: 100,
      name: '注册供应商_${DateTime.now().millisecondsSinceEpoch}',
    );
    Fluttertoast.showToast(msg: "图片已保存到相册", gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageBar(title: '注册供应商'),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            saveImage();
          },
          child: RepaintBoundary(
            key: qrKey,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(12),
              width: 200,
              height: 200,
              child: PrettyQrView(qrImage: _qrImage),
            ),
          ),
        ),
      ),
    );
  }
}
