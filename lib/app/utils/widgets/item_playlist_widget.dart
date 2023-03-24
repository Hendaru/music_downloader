import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

class ItemPlayListWidget extends StatelessWidget {
  const ItemPlayListWidget(
      {Key? key,
      required this.itemPlayList,
      required this.functionItem,
      this.functionDelete})
      : super(key: key);

  final ResPlaylistModel itemPlayList;
  final Function(ResPlaylistModel) functionItem;
  final Function(ResPlaylistModel)? functionDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            commonCacheImageWidget(
                    itemPlayList.image.isEmptyOrNull
                        ? ""
                        : "${itemPlayList.image}",
                    idcacheKey: itemPlayList.idPlayList.validate(),
                    width: 20.w,
                    fit: BoxFit.cover,
                    isSquere: true)
                .cornerRadiusWithClipRRect(3.w),
            2.w.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemPlayList.namePlayList.validate(),
                  overflow: TextOverflow.ellipsis,
                  style: boldTextStyle(),
                ),
                1.h.height,
                Text(
                  "Playlist",
                  style: secondaryTextStyle(),
                ),
              ],
            ).expand(),
          ],
        )
            .onTap(() => functionItem(itemPlayList),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            .expand(),
        functionDelete != null
            ? SizedBox(
                height: 6.h,
                width: 5.w,
                child: SvgPicture.asset(MainAssets.ic_trash2,
                    width: 4.w,
                    height: 4.w,
                    // ignore: unrelated_type_equality_checks
                    color: greyColor),
              ).onTap(() => functionDelete!(itemPlayList),
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent)
            : const SizedBox(),
      ],
    ).paddingBottom(1.h);
  }
}
