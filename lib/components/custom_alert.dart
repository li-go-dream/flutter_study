import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:study/common/dialog/index.dart';

/// 问话弹窗 和bottomDialog不同的传参方式
Future<bool?> customDialog(
  BuildContext context,
  DialogPar par,
  FnType? fn,
) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: .min,
          children: [
            // content
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Center(child: Text(par.content, style: par.contentStyle)),
            ),
            Row(
              children: [
                if (par.cancelText != null && par.cancelText!.isNotEmpty)
                  Flexible(
                    fit: .tight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xFFE5E6EB)),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            par.cancelText!,
                            style: TextStyle(
                              color: Color(par.cancelColor),
                              fontSize: 16,
                              fontWeight: .w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (par.okText != null && par.okText!.isNotEmpty)
                  Flexible(
                    fit: .tight,
                    child: InkWell(
                      onTap: () {
                        if (fn != null) {
                          fn(Navigator.of(context).pop, true);
                        } else {
                          Navigator.of(context).pop(true);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xFFE5E6EB)),
                            left: BorderSide(color: Color(0xFFE5E6EB)),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            par.okText!,
                            style: TextStyle(
                              color: Color(par.okColor),
                              fontSize: 16,
                              fontWeight: .w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

/// 底部弹窗
Future<bool?> bottomDialog({
  required BuildContext context,
  required String title,
  bool showBtn = true,
  bool customContent = false,
  required Widget content,
  FnType? fn,
  double? height,
}) async {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    useSafeArea: true,
    useRootNavigator: true,
    context: context,
    isScrollControlled: true, // 允许自定义高度
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    // ),
    builder: (BuildContext context) {
      return SafeArea(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets, // 避免键盘遮挡
          child: DraggableScrollableSheet(
            initialChildSize: height ?? 0.5, // 初始高度占屏幕 50%
            minChildSize: height ?? 0.5, // 最小高度 30%
            maxChildSize: height ?? 0.5, // 最大高度 70%（你可以根据需求调整）
            expand: false,
            builder: (context, scrollController) {
              // 👆 关键：scrollController 由 DraggableScrollableSheet 提供
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. 标题区域（固定高度）
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 12,
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1D2129),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap: () => Navigator.of(context).pop(false),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 2. 内容区域（可滚动，绑定 scrollController）
                    Expanded(
                      child: SizedBox(
                        width: .infinity,
                        child: customContent
                            ? content
                            : SingleChildScrollView(
                                controller: scrollController, // 👈 关键：传入滚动控制器
                                child: content,
                              ),
                      ),
                    ),
                    // 3. 底部按钮区域（固定高度）
                    if (showBtn)
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Color(0xFFE7E7E7)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE2F3F0),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0),
                                      bottomLeft: Radius.circular(8.0),
                                    ),
                                    onTap: () =>
                                        Navigator.of(context).pop(false),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: Center(
                                        child: const Text(
                                          '取消',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF27C1A5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF27C1A5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                    ),
                                    onTap: () async {
                                      if (fn != null) {
                                        fn(Navigator.of(context).pop, true);
                                      } else {
                                        Navigator.of(context).pop(true);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 9,
                                      ),
                                      child: Center(
                                        child: const Text(
                                          '确认',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    },
  );
}

/// 照片选择
Future<List<File>?> choosePhoto({
  required BuildContext content,
  int limit = 1,
}) async {
  void handleChoosePho(int limit) async {
    final ImagePicker picker = ImagePicker();
    if (limit > 1) {
      if (Platform.isAndroid) {
        final ImagePickerPlatform imagePickerImplementation =
            ImagePickerPlatform.instance;
        if (imagePickerImplementation is ImagePickerAndroid) {
          imagePickerImplementation.useAndroidPhotoPicker = true;
        }
      }
      final List<XFile> imglist = await picker.pickMultiImage(limit: limit);
      if (imglist.isNotEmpty && content.mounted) {
        Navigator.of(
          content,
        ).pop(imglist.map((file) => File(file.path)).toList());
      }
    } else {
      final XFile? img = await picker.pickImage(source: ImageSource.gallery);
      if (img != null && content.mounted) {
        Navigator.of(content).pop([File(img.path)]);
      }
    }
  }

  /// 拍照
  void takePhotoWithCamera() async {
    final ImagePicker picker = ImagePicker();
    // 调用相机拍照
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null && content.mounted) {
      Navigator.of(content).pop([File(photo.path)]);
    }
  }

  return showModalBottomSheet(
    backgroundColor: Colors.white,
    useSafeArea: true,
    useRootNavigator: true,
    context: content,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: .min,
        children: [
          InkWell(
            onTap: () {
              handleChoosePho(limit);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  '从相册选择',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w400,
                    color: Color.fromRGBO(0, 0, 0, 0.90),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFF7F7F7),
          ),
          InkWell(
            onTap: () {
              takePhotoWithCamera();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  '拍照',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w400,
                    color: Color.fromRGBO(0, 0, 0, 0.90),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 8,
            width: double.infinity,
            color: const Color(0xFFF7F7F7),
          ),
          InkWell(
            onTap: () {
              Navigator.of(content).pop();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  '取消',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w400,
                    color: Color.fromRGBO(0, 0, 0, 0.90),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
