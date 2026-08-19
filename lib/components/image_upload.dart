import 'dart:io';
import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:study/components/custom_alert.dart';
import 'package:uuid/uuid.dart';
import 'package:study/common/data/index.dart';

class ImageUpload extends StatefulWidget {
  final int limit;
  final List<ImageItem?> list;
  final void Function(List<ImageItem?>)? imgsChange;
  const ImageUpload({
    super.key,
    this.limit = 1,
    this.list = const [],
    this.imgsChange,
  });

  @override
  State<ImageUpload> createState() => _ImageUpload();
}

class _ImageUpload extends State<ImageUpload> {
  late List<ImageItem> list;

  @override
  void initState() {
    super.initState();
    list = List.from(widget.list);
  }

  // 选择图片
  Future<void> chooseImages(BuildContext context) async {
    final List<File>? fileList = await choosePhoto(
      content: context,
      limit: widget.limit,
    );
    if (fileList != null && fileList.isNotEmpty) {
      final List<File> imgs = fileList.take(widget.limit).toList();
      setState(() {
        list.addAll(
          imgs.map((it) {
            return ImageItem(
              id: Uuid().v4(),
              url: '',
              islocal: '1',
              locakurl: it,
            );
          }),
        );
      });
      widget.imgsChange?.call(list);
    }
  }

  // 删除
  void deleteImages(ImageItem item) {
    int index = list.indexWhere((it) => it.id == item.id);
    if (index != -1) {
      setState(() {
        list.removeAt(index);
      });
      widget.imgsChange?.call(list);
    }
  }

  // 预览图片
  void previewImags(ImageItem item) {
    int initialPage = list.indexWhere((it) => it.id == item.id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: PhotoViewGallery.builder(
              itemCount: list.length,
              pageController: PageController(initialPage: initialPage),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  onTapUp: (context, details, controllerValue) {
                    Navigator.pop(context);
                  },
                  imageProvider: list[index].islocal == '1'
                      ? FileImage(list[index].locakurl!)
                      : NetworkImage(list[index].url),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: .horizontal,
      spacing: 8,
      runSpacing: 8,
      children: [
        ...list.map((item) {
          return Container(
            key: Key(item.id),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFDCDCDC)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                if (item.islocal == '1')
                  InkWell(
                    onTap: () {
                      previewImags(item);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        item.locakurl!,
                        width: 80,
                        height: 80,
                        fit: .cover,
                      ),
                    ),
                  ),

                if (item.islocal == '2')
                  InkWell(
                    onTap: () {
                      previewImags(item);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: item.url,
                        width: 80,
                        height: 80,
                        fit: .cover,
                      ),
                    ),
                  ),

                Positioned(
                  top: 4,
                  right: 4,
                  child: InkWell(
                    onTap: () {
                      deleteImages(item);
                    },
                    child: CircleAvatar(
                      radius: 9, // 直径 18
                      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
                      child: Icon(Icons.close, size: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        if (widget.limit > list.length)
          InkWell(
            onTap: () {
              chooseImages(context);
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFDCDCDC)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset(
                      'assets/images/photo.png',
                      width: 24,
                      height: 24,
                    ),
                    const Text(
                      '上传图片',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w400,
                        color: Color.fromRGBO(0, 0, 0, 0.60),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
