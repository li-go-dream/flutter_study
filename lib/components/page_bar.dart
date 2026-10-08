import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';

class PageBar extends StatelessWidget implements PreferredSizeWidget {
  final Function? rightFn;
  final String title;
  final Widget? leftBtn;
  final Decoration? decoration;
  const PageBar({
    super.key,
    this.rightFn,
    this.title = '',
    this.leftBtn,
    this.decoration,
  });

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 44, 8, 8),
      decoration: decoration,
      child: Row(
        children: [
          if (leftBtn != null)
            InkWell(
              child: leftBtn,
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  FlutterExitApp.exitApp();
                  // 无上一级，可执行退出应用或跳转首页
                }
              },
            )
          else
            InkWell(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  FlutterExitApp.exitApp();
                  // 无上一级，可执行退出应用或跳转首页
                }
              },
            ),
          if (title.trim().isNotEmpty)
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w600,
                    color: Color(0xFF1D2129),
                  ),
                ),
              ),
            ),
          if (rightFn != null)
            InkWell(
              child: Icon(Icons.add_circle_outline, size: 20),
              onTap: () {
                rightFn!();
              },
            )
          else
            const SizedBox(width: 20, height: 20),
        ],
      ),
    );
  }
}
