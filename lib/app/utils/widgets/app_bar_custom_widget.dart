import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:sizer/sizer.dart';

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarCustomWidget(
      {Key? key,
      this.title,
      this.backBtn,
      this.height = kToolbarHeight,
      this.iconBackColor,
      this.action,
      this.leading,
      this.centerTitle = false})
      : super(key: key);

  final String? title;
  final Function? backBtn;
  final double height;
  final Widget? action;
  final Widget? leading;
  final Color? iconBackColor;
  final bool centerTitle;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: centerTitle,
        // backgroundColor: whiteColor,
        actions: [action ?? const SizedBox()],
        title: Text(title ?? "Back",
            style: boldTextStyle(
                color: Theme.of(context).colorScheme.onSecondary)),
        leading: leading ??
            Icon(
              Icons.arrow_back,
              size: 7.w,
              color: iconBackColor ?? secondaryColor,
            ).onTap(backBtn ?? () => Get.back(),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent));
  }
}
