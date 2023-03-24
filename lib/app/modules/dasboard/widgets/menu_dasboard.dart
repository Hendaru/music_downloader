import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:sizer/sizer.dart';

class MenuDasboard extends GetView<DasboardController> {
  const MenuDasboard(
      {Key? key,
      this.pos,
      required this.icon,
      required this.currentIndex,
      required this.name})
      : super(key: key);

  final int? pos;
  final String icon;
  final String name;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    DasboardController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon,
            width: 6.5.w,
            height: 6.5.w,
            // ignore: unrelated_type_equality_checks
            color:
                currentIndex == pos ? colorMode(context).primary : greyColor),
        1.h.height,
        Text(
          name,
          style: secondaryTextStyle(
              size: 8.sp,
              color:
                  currentIndex == pos ? colorMode(context).primary : greyColor,
              // color: currentIndex == pos ? primaryColor : greyColor,
              weight: FontWeight.w600),
        )
      ],
    ).onTap(() {
      controller.setCurrentIndex(pos!);
    },
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent).expand();
  }
}
