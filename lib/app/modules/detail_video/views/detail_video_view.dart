import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:music_download_youtube/app/modules/dasboard/controllers/dasboard_controller.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/app_bar_custom_widget.dart';
import 'package:music_download_youtube/app/utils/widgets/shimmer/skeleton_widget.dart';
import 'package:music_download_youtube/r.dart';
import 'package:sizer/sizer.dart';

import '../controllers/detail_video_controller.dart';

class DetailVideoView extends GetView<DetailVideoController> {
  const DetailVideoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DasboardController dasboardController = Get.put(DasboardController());
    return Scaffold(
      appBar: const AppBarCustomWidget(
        title: "Detail Video",
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => controller.errorVideo.value
              ? Text("Error Broo")
              : controller.chewieController?.value != null
                  ? Chewie(
                      controller: controller.chewieController!.value!,
                    ).withSize(height: 30.h, width: 100.w)
                  : SkeletonWidget(
                      height: 25.h,
                      width: 100.w,
                    ).paddingSymmetric(
                      horizontal: defaultPaddingHorizontalGlobal)),
          2.h.height,
          Text(
            "why you understand English but CAN'T speak fluently",
            style: boldTextStyle(),
          ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
          2.h.height,
          Obx(() => controller.loadingTranding.value
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.amber),
                        backgroundColor:
                            Platform.isAndroid ? Colors.transparent : null,
                      ),
                    ).expand()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(() => AppButtonWidget(
                                  onTap: () {
                                    dasboardController.downloadFileVideo(
                                      id: "video-oXOTlM9n-_k",
                                      url:
                                          "https://rr2---sn-2uuxa3vh-wvbz.googlevideo.com/videoplayback?expire=1683684409&ei=2adaZM1zjby8BO-Bg6AI&ip=36.73.115.9&id=o-APpSFlxynt2w_qVy2I0rKXnJyzbTvhfBmtOzNEN_115b&itag=22&source=youtube&requiressl=yes&mh=ex&mm=31%2C29&mn=sn-2uuxa3vh-wvbz%2Csn-npoe7nsr&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=573750&vprv=1&svpuc=1&mime=video%2Fmp4&cnr=14&ratebypass=yes&dur=861.135&lmt=1649854319680150&mt=1683662472&fvip=4&fexp=24007246&c=ANDROID&txp=4532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgVCNoodjpByQVhXcA0LWl2MdZ1pfHJu9IZSBD6qIAxWYCIGEWB5UN5M5vvcglfZjxI4L6JIff7ClIn212jXIA94s7&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgWH0U8HBz-uIGbMyE3wjj0UJwGzbggvqm3AzX1DJu23cCIApSySsAxPYUMoSNKO1fxJuVq6mbmQ1pP-78cpoI0bKv",
                                      title:
                                          "why you understand English but CAN'T speak fluently",
                                      duration: "1jam",
                                    );
                                  },
                                  text: dasboardController
                                          .progreesVideo.value.isEmpty
                                      ? "Download Video"
                                      : "${dasboardController.progreesVideo.value}%",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryVariant,
                                  textStyle: boldTextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryVariant),

                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  enableScaleAnimation: false,
                                  // loadingColor: primaryColor,
                                  loading: false,
                                  shapeBorder: RoundedRectangleBorder(
                                      borderRadius: radius(defaultRadius)),
                                )).expand(),
                            2.w.width,
                            Obx(() => AppButtonWidget(
                                  onTap: () {
                                    dasboardController.downloadFileAudio(
                                      id: "audio-oXOTlM9n-_k",
                                      url:
                                          "https://rr2---sn-2uuxa3vh-wvbz.googlevideo.com/videoplayback?expire=1683685801&ei=Sa1aZJPiNY2KvwTMkbToAw&ip=36.73.115.9&id=o-AB4HKDPsl2tbc0qF_4J1aNjp5lxcwkR3GVZGwc0o6py-&itag=140&source=youtube&requiressl=yes&mh=ex&mm=31%2C29&mn=sn-2uuxa3vh-wvbz%2Csn-npoe7nsr&ms=au%2Crdu&mv=m&mvi=2&pl=21&initcwndbps=697500&vprv=1&svpuc=1&mime=audio%2Fmp4&gir=yes&clen=13937736&dur=861.135&lmt=1649847092168307&mt=1683663908&fvip=4&keepalive=yes&fexp=24007246&c=ANDROID&txp=4532434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Csvpuc%2Cmime%2Cgir%2Cclen%2Cdur%2Clmt&sig=AOq0QJ8wRQIgAuXBbd27pNL6LtHx96yk4MyaaG1GaZsIEXslrZunebQCIQDS8td8NZ0787EN1tUex_-LkvYbwLH6nLr-OZ4OdqLa-w%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgcEOjI8oQ5WrW3f832jDW-9apWp5vx90XYLIHu6TKMJACIExqTOmj_mkXCtB0lk4t8ZSQgaYaGixdVurM-JXFKgTa",
                                      title:
                                          "why you understand English but CAN'T speak fluently",
                                      duration: "1jam",
                                    );
                                  },
                                  text: dasboardController
                                          .progreesAudio.value.isEmpty
                                      ? "Download Audio"
                                      : "${dasboardController.progreesAudio.value}%",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryVariant,
                                  textStyle: boldTextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondaryVariant),

                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  enableScaleAnimation: false,
                                  // loadingColor: primaryColor,
                                  loading: false,
                                  shapeBorder: RoundedRectangleBorder(
                                      borderRadius: radius(defaultRadius)),
                                )).expand(),
                          ],
                        ),
                        1.h.height,
                        Obx(
                          () => dasboardController.progreesDouble.value == null
                              ? Divider(
                                  thickness: 4.0,
                                )
                              : LinearProgressIndicator(
                                  value:
                                      dasboardController.progreesDouble.value,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.amber),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                ),
                        ),
                        1.h.height,
                        Text(
                          "Popular Videos",
                          style: boldTextStyle(),
                        ),
                        1.h.height,
                        Column(
                          children: controller.videosTrending
                              .map(
                                (e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    commonCacheImageWidget(
                                            e.thumbnails?[0].url.validate(),
                                            width: 30.w,
                                            // idcacheKey: element.idPlayList.validate(),
                                            fit: BoxFit.cover,
                                            isSquere: false)
                                        .cornerRadiusWithClipRRect(3.w),
                                    3.w.width,
                                    Text(
                                      e.title.validate(),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: boldTextStyle(),
                                    ).expand(),
                                    SvgPicture.asset(MainAssets.ic_more_more,
                                            width: 4.w,
                                            height: 4.w,
                                            // ignore: unrelated_type_equality_checks
                                            color: greyColor)
                                        .withWidth(10.w)
                                  ],
                                ).marginOnly(bottom: 2.h).onTap(() {}),
                              )
                              .toList(),
                        ),
                      ],
                    ))
              .withScroll(
                  physics: BouncingScrollPhysics(),
                  reverse: false,
                  padding: EdgeInsets.symmetric(vertical: 1.h))
              .paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal)
              .expand()
        ],
      ),
    );
  }
}
