import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:music_download_youtube/app/theme/app_colors.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

double defaultRadius = 3.w;
double defaultButtonRadius = 20.0;
double defaultBlurRadius = 4.0;
double defaultSpreadRadius = 1.0;
double defaultWidthBorder = 1.0;
double defaultHorizontalGlobal = 2.w;
double defaultPaddingHorizontalGlobal = 5.w;
double defaultVerticalGlobal = 2.w;
double defaultAppButtonRadius = 8.0;
double defaultAppButtonElevation = 0.0;
double defaultAppBarElevation = 4.0;
int passwordLengthGlobal = 6;

String? fontFamilyBoldGlobal;
String? fontFamilyPrimaryGlobal;
String? fontFamilySecondaryGlobal;
Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
// Color textSecondaryColorGlobal = Theme.of(Get.context!).colorScheme.onSecondary;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;
double textBoldSizeGlobal = 12.sp;
double textPrimarySizeGlobal = 12.sp;
double textSecondarySizeGlobal = 10.sp;
double h1 = 18.sp;
double h2 = 16.sp;
double h3 = 14.sp;
bool enableAppButtonScaleAnimationGlobal = true;

int? appButtonScaleAnimationDurationGlobal;
ShapeBorder? defaultAppButtonShapeBorder;

Color? defaultInkWellSplashColor;
Color? defaultInkWellHoverColor;
Color? defaultInkWellHighlightColor;
double? defaultInkWellRadius;

var errorSomethingWentWrong = 'Something Went Wrong';
var errorThisFieldRequired = 'This field is required';
var errorThisFieldEmail = 'This field is not email';
var errorInternetNotAvailable = 'Your internet is not working';

//SharePreferences
String playlistSharePref = "playlist";
String idPlayNow = "idPlayNow";
String statusEnumPlayFrom = "statusEnumPlayFrom";
String musicListLocal = "musicListLocal";
String downloadedListLocal = "downloadedListLocal";
// String likeSharePref = "like";

String listGenrePref = "listGenrePref";
String listArtistPref = "listArtistPref";

String listMusicFromApi = "listMusicFromApi";

String adShowreward = "adShowreward";
String adShowSimple = "adShowSimple";

String appVersion = "appVersion";

String appStoreId = 'com.video.music.downloader';
String microsoftStoreId = 'com.video.music.downloader';

double tabletBreakpointGlobal = 600.0;
double desktopBreakpointGlobal = 720.0;

String baseUrl = dotenv.env['BASE_URL'].validate();

// Facebook
// const fbBannerId = "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047";
// const fbBannerIdIos = "";
// const fbInterstitialId =
//     "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617";
// const fbInterstitialIdIos = "";

// String admobBanner = 'ca-app-pub-7779081722205902/6239850921';
// String admobInterstitial = 'ca-app-pub-7779081722205902/9764162963';
// String admobRewarded = 'ca-app-pub-7779081722205902/8451081294';

String youtubeToken = dotenv.env['API_YOUTUBE_KEY'].validate();

// String admobBannerFake = 'ca-app-pub-3940256099942544/6300978111';
// String admobInterstitialFake = 'ca-app-pub-3940256099942544/1033173712';
// String admobRewardedFake = 'ca-app-pub-3940256099942544/5224354917';
