import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/add_like_playlist/add_like_playlist_controller.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

class AddLikePlaylistWidget extends StatelessWidget {
  const AddLikePlaylistWidget({Key? key, required this.detailMusic})
      : super(key: key);

  final ResMusicDataModel detailMusic;

  @override
  Widget build(BuildContext context) {
    AddLikePlaylistController controller = Get.put(AddLikePlaylistController());
    DasboardController dasboardController = Get.put(DasboardController());
    return SizedBox(
      height: 60.h,
      child: Column(
        children: [
          1.h.height,
          SizedBox(
              width: 20.w,
              child: const Divider(
                thickness: 4.0,
              )),
          3.h.height,
          commonCacheImageWidget(
                  detailMusic.imageLagu.isEmptyOrNull
                      ? ""
                      : "$baseUrl/${detailMusic.imageLagu}",
                  idcacheKey: detailMusic.id.validate(),
                  width: 40.w,
                  fit: BoxFit.cover,
                  isSquere: true)
              .cornerRadiusWithClipRRect(3.w),
          3.h.height,
          Text(
            detailMusic.judulLagu.validate(),
            style: boldTextStyle(),
          ),
          2.h.height,
          Text(
            "Hore 4",
            style: secondaryTextStyle(),
          ),
          3.h.height,
          Row(
            children: [
              SvgPicture.asset(MainAssets.ic_like2,
                  width: 7.w,
                  height: 7.w,
                  // ignore: unrelated_type_equality_checks
                  color: detailMusic.idLike == "1" ? Colors.amber : greyColor),
              3.w.width,
              Text(
                "Like",
                style: boldTextStyle(),
              )
            ],
          ).onTap(() {
            controller.detailMusic = detailMusic;
            if (detailMusic.idLike == "1") {
              controller.setLikeMusic("");
            } else {
              controller.setLikeMusic("1");
            }
            Get.back();
          }),
          3.h.height,
          Row(
            children: [
              SvgPicture.asset(MainAssets.ic_list_music,
                  width: 7.w,
                  height: 7.w,
                  // ignore: unrelated_type_equality_checks
                  color: greyColor),
              3.w.width,
              Text(
                "Add Playlist",
                style: boldTextStyle(),
              )
            ],
          ).onTap(() {
            // var getPlayListString = getPlayListFromSharePref();
            controller.detailMusic = detailMusic;
            Get.back();
            controller.getPlaylist();
            controller.openBottomSheetPlayList(context);
          }),
          3.h.height,
          Obx(() => Row(
                children: [
                  SvgPicture.asset(MainAssets.ic_trash,
                      width: 7.w,
                      height: 7.w,
                      // ignore: unrelated_type_equality_checks
                      color: Colors.red),
                  3.w.width,
                  Text(
                    "Delete",
                    style: boldTextStyle(color: Colors.red),
                  )
                ],
              ).onTap(() async {
                await showDialogBox(
                    context, "Delete Music", "Are you sure you want to delete?",
                    onCall: () {
                  Get.back();
                  controller
                      .delFile(detailMusic.id.validate())
                      .then((value) => Get.back());
                }, onCancelCall: () {
                  Get.back();
                });
              }).visible(dasboardController.currentSongIdNotifier.value !=
                  detailMusic.id)),
          3.h.height,
        ],
      ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
    );
  }
}
