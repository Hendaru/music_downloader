import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/admob.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/extensions/int_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/main.dart';
import 'package:music_download_youtube/r.dart';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

get getContext => navigatorKey.currentState?.overlay?.context;

/// Hide soft keyboard
hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Function(BuildContext, String) placeholderWidgetFn() =>
    (_, s) => placeholderWidget();

Widget placeholderWidget() =>
    // SizedBox(width: 1.w, height: 1.w, child: const CircularProgressIndicator());
    SizedBox(
        child: Image.asset(
      MainAssets.image_kosong,
      fit: BoxFit.fill,
      width: 3.w,
      height: 3.w,
      color: shadowColorGlobal,
    ));

Widget placeholderImageWidget({width, height}) => Image.asset(
      MainAssets.img_kosong,
      fit: BoxFit.fill,
      width: width,
      height: height,
    );

Widget commonCacheImageWidget(String? url,
    {double? width,
    BoxFit? fit,
    double? height,
    required bool isSquere,
    String? idcacheKey}) {
  if (url.toString().startsWith('http')) {
    return CachedNetworkImage(
      placeholder:
          placeholderWidgetFn() as Widget Function(BuildContext, String)?,
      imageUrl: '$url',
      height: isSquere ? width : height,
      cacheKey: idcacheKey,
      width: width,
      fit: fit,
    );
  } else {
    return Image.asset(
      MainAssets.image_kosong,
      height: isSquere ? width : height,
      width: width,
      fit: fit,
      color: shadowColorGlobal,
    );
  }
}

String toPrettyJSONString(jsonObject) {
  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(jsonObject);
}

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

EdgeInsets dynamicAppButtonPadding(BuildContext context) {
  return EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w);
}

extension BooleanExtensions on bool? {
  /// Validate given bool is not null and returns given value if null.
  bool validate({bool value = false}) => this ?? value;
}

extension DoubleExtensions on double? {
  /// Validate given bool is not null and returns given value if null.
  double validate({double value = 0.0}) => this ?? value;

  Widget get height => SizedBox(height: this?.toDouble());

  Widget get width => SizedBox(width: this?.toDouble());

  String get toCurrency {
    // final lang = Get.locale?.languageCode ?? 'en';

    final formatCurrency = NumberFormat.currency(
      locale: "id",
      symbol: "Rp ",
      decimalDigits: 0,
    );
    return formatCurrency.format(this ?? 0);
  }

  String get toDecimal {
    final formatCurrency = NumberFormat.currency(
      locale: "id",
      symbol: "",
      decimalDigits: 0,
    );
    return formatCurrency.format(this ?? 0);
  }
}

extension ContextExtensions on BuildContext {
  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);

  /// Returns cardColor Color
  Color get cardColor => theme.cardColor;

  /// Returns cardColor Color
  ColorScheme get colorMode {
    final abc = theme.colorScheme;
    return abc;
  }
}

ColorScheme colorMode(BuildContext context) {
  final colorsMode = Theme.of(context).colorScheme;
  return colorsMode;
}

InputDecoration inputDecoration(BuildContext context,
    {String? label,
    String? hintText,
    Widget? prefixIcon,
    Color? fillColor,
    Color? borderColor}) {
  return InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(
            color: borderColor ?? viewLineColor, width: defaultWidthBorder)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: defaultWidthBorder)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(
            color: borderColor ?? viewLineColor, width: defaultWidthBorder)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(
            color: borderColor ?? viewLineColor, width: defaultWidthBorder)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(
            color: borderColor ?? viewLineColor, width: defaultWidthBorder)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
        borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: defaultWidthBorder)),
    alignLabelWithHint: true,
    filled: true,
    fillColor: fillColor ?? Colors.white,
    isDense: true,
    hintText: hintText ?? "Sample Text",
    hintStyle: secondaryTextStyle(),
    prefixIcon: prefixIcon,
    // labelText: label ?? "Sample Text",
    // labelStyle: secondaryTextStyle(size: 12.sp),
  );
}

toast(
  String? title, {
  String? messageText,
  Color? textColor,
  SnackPosition? snackPosition,
  Color? bgColor,
}) async {
  Fluttertoast.showToast(
    msg: title.validate(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 6,
    backgroundColor:
        bgColor ?? Theme.of(Get.context!).snackBarTheme.backgroundColor!,
    textColor:
        Theme.of(Get.context ?? getContext).snackBarTheme.actionTextColor,
    fontSize: 16.0,
  );
  // Get.rawSnackbar(
  //     messageText: Center(
  //       child: Text(
  //         title.validate(),
  //         style: boldTextStyle(
  //             color: Theme.of(Get.context ?? getContext)
  //                 .snackBarTheme
  //                 .actionTextColor),
  //       ),
  //     ),
  //     // messageText: messageText.isEmptyOrNull
  //     //     ? const SizedBox()
  //     //     : Center(
  //     //         child: Text(
  //     //           messageText.validate(),
  //     //           style: secondaryTextStyle(
  //     //               color: Theme.of(Get.context ?? getContext)
  //     //                   .snackBarTheme
  //     //                   .actionTextColor),
  //     //         ),
  //     //       ),
  //     // icon: Icon(Icons.person, color: Colors.white),
  //     snackPosition: snackPosition ?? SnackPosition.TOP,
  //     duration: const Duration(seconds: 2),
  //     backgroundColor:
  //         bgColor ?? Theme.of(Get.context!).snackBarTheme.backgroundColor!,
  //     snackStyle: SnackStyle.GROUNDED);
}

extension DurationExtensions on Duration {
  String get timeFormat {
    String minute =
        int.parse(toString().split('.').first.padLeft(8, "0").split(':')[1])
            .toString();
    String second = toString().split('.').first.padLeft(8, "0").split(':')[2];
    return ("$minute:$second");
  }
}

showDialogBox(context, title, subTitle,
    {Color? btnConfirmColor, Function? onCall, Function? onCancelCall}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: radius()),
          actionsPadding: EdgeInsets.all(5.w),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: boldTextStyle(size: h2), textAlign: TextAlign.center),
              2.h.height,
              Text(subTitle,
                  style: boldTextStyle(), textAlign: TextAlign.center),
            ],
          ),
          actions: [
            Row(
              children: [
                onCancelCall != null
                    ? AppButtonWidget(
                        elevation: 0,
                        shapeBorder: RoundedRectangleBorder(
                          borderRadius: radius(defaultAppButtonRadius),
                          side: const BorderSide(color: viewLineColor),
                        ),
                        color: context.cardColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.close_rounded, size: 5.w),
                            5.w.width,
                            Text("cancel".capitalizeFirstLetter(),
                                style: boldTextStyle()),
                          ],
                        ).fit(),
                        onTap: () {
                          onCancelCall.call();
                        },
                      ).expand()
                    : SizedBox(),
                onCancelCall != null ? 5.w.width : SizedBox(),
                AppButtonWidget(
                  elevation: 0,
                  color: btnConfirmColor ?? primaryColor,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: radius(defaultAppButtonRadius),
                    // side: const BorderSide(color: viewLineColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: Colors.white, size: 5.w),
                      5.w.width,
                      Text("yes".capitalizeFirstLetter(),
                          style: boldTextStyle(color: Colors.white)),
                    ],
                  ).fit(),
                  onTap: () {
                    onCall!.call();
                  },
                ).expand(),
              ],
            ),
          ],
        );
      });
}

// Future<bool> liked(String id) async {
//   var listMusic = await getMusicListFromSharePref();
//     ResMusicDataModel item = listMusic.firstWhere(((e) => e.id == id));
//     if (item.idLike == "1") {
//       return true;
//     }

//   return false;
// }

bool inPlaying(String idMusic, ResMusicDataModel detailMusic) {
  if (detailMusic.id == idMusic) {
    return true;
  } else {
    return false;
  }
}

openAdShowReward() {
  int ad = getIntAsync(adShowreward).validate();
  int adCount = ad + 1;

  if (adCount == 4) {
    adShowrewardedAd();
    setValue("adShowreward", 0);
  } else {
    setValue("adShowreward", adCount);
  }
}

openAdShow() {
  int ad = getIntAsync(adShowSimple).validate();
  int adCount = ad + 1;

  if (adCount == 5) {
    adShow();
    setValue(adShowSimple, 0);
  } else {
    setValue(adShowSimple, adCount);
  }
}

// String filterArtists(String idArtist) {
//   var listArtistString = getStringAsync(listArtistPref);
//   if (listArtistString.isNotEmpty) {
//     List<ResArtistDataModel> listArtistFromApi = [];

//     listArtistFromApi = (jsonDecode(listArtistString) as List<dynamic>)
//         .map<ResArtistDataModel>((e) => ResArtistDataModel.fromJson(e))
//         .toList();

//     var artist = listArtistFromApi.firstWhereOrNull((e) => e.id == idArtist);

//     if (artist != null) {
//       return artist.nameArtist.validate();
//     }
//   }
//   return "";
// }

List<ResMusicDataModel> getMusicListFromSharePref() {
  List<ResMusicDataModel> listMusic = [];
  String? getListMusicString = getStringAsync(musicListLocal);
  if (getListMusicString.isNotEmpty) {
    listMusic.clear();
    if (!getListMusicString.isEmptyOrNull) {
      listMusic = (jsonDecode(getListMusicString) as List<dynamic>)
          .map<ResMusicDataModel>((e) => ResMusicDataModel.fromJson(e))
          .toList();
    }
  }

  return listMusic;
}

List<ResPlaylistModel> getPlayListFromSharePref() {
  List<ResPlaylistModel> playlist = [];

  String? getListString = getStringAsync(playlistSharePref);
  if (getListString.isNotEmpty) {
    playlist.clear();
    if (!getListString.isEmptyOrNull) {
      playlist = (jsonDecode(getListString) as List<dynamic>)
          .map<ResPlaylistModel>((e) => ResPlaylistModel.fromJson(e))
          .toList();
    }
  }

  return playlist;
}

Stream<String> downloadProgressStream(String url, String fileName) async* {
  final streamController = StreamController<String>();
  Dio dio = Dio();
  String dir = (await getApplicationDocumentsDirectory()).path;
  File file = File('$dir/$fileName.mp3');
  bool fileExists = await file.exists();

  if (fileExists) {
    streamController.close();
  } else {
    try {
      dio.download(
        url,
        "$dir/$fileName.mp3",
        onReceiveProgress: (received, total) {
          if (total != -1) {
            streamController.add((received / total * 100).toStringAsFixed(0));
          }
        },
      );
    } catch (e) {
      streamController.addError(e);
    }
  }

  streamController.stream;
}

String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
  if (!url.contains("http") && (url.length == 11)) return url;
  if (trimWhitespaces) url = url.trim();

  for (var exp in [
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:music\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/shorts\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
  ]) {
    Match? match = exp.firstMatch(url);
    if (match != null && match.groupCount >= 1) return match.group(1);
  }

  return null;
}

class ThumbnailQuality {
  /// 120*90
  static const String defaultQuality = 'default';

  /// 320*180
  static const String medium = 'mqdefault';

  /// 480*360
  static const String high = 'hqdefault';

  /// 640*480
  static const String standard = 'sddefault';

  /// Unscaled thumbnail
  static const String max = 'maxresdefault';
}

String getThumbnail({
  required String videoId,
  String quality = ThumbnailQuality.standard,
  bool webp = true,
}) =>
    webp
        ? 'https://i3.ytimg.com/vi_webp/$videoId/$quality.webp'
        : 'https://i3.ytimg.com/vi/$videoId/$quality.jpg';
