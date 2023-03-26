import 'package:get/get.dart';

import '../modules/dasboard/bindings/dasboard_binding.dart';
import '../modules/dasboard/views/dasboard_view.dart';
import '../modules/download_page/bindings/download_page_binding.dart';
import '../modules/download_page/views/download_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/like/bindings/like_binding.dart';
import '../modules/like/views/like_view.dart';
import '../modules/list_all_music/bindings/list_all_music_binding.dart';
import '../modules/list_all_music/views/list_all_music_view.dart';
import '../modules/playList/bindings/play_list_binding.dart';
import '../modules/playList/views/play_list_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASBOARD,
      page: () => const DasboardView(),
      binding: DasboardBinding(),
    ),
    GetPage(
      name: _Paths.LIKE,
      page: () => const LikeView(),
      binding: LikeBinding(),
    ),
    GetPage(
      name: _Paths.PLAY_LIST,
      page: () => const PlayListView(),
      binding: PlayListBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.DOWNLOAD_PAGE,
      page: () => const DownloadPageView(),
      binding: DownloadPageBinding(),
    ),
    GetPage(
      name: _Paths.LIST_ALL_MUSIC,
      page: () => const ListAllMusicView(),
      binding: ListAllMusicBinding(),
    ),
  ];
}
