import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';
import 'package:music_download_youtube/app/data/models/response/res_playlist_model/res_playlist_model.dart';
import 'package:music_download_youtube/app/modules/dasboard/views/player_dasboard_view.dart';
import 'package:music_download_youtube/app/modules/home/controllers/home_controller.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/enums.dart';
import 'package:music_download_youtube/app/utils/extensions/app_text_field.dart';
import 'package:music_download_youtube/app/utils/extensions/share_pref.dart';
import 'package:music_download_youtube/app/utils/extensions/string_extensions.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/item_playlist_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

class AddLikePlaylistController extends GetxController {
  final playlist = <ResPlaylistModel>[].obs;
  final like = <ResMusicModel>[].obs;

  TextEditingController playlistTextController = TextEditingController();
  GlobalKey<FormState> addPlaylistformKey = GlobalKey<FormState>();

  ResMusicDataModel? detailMusic;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    getPlaylist();
  }

  void getPlaylist() {
    String? getPlayListString = getStringAsync(playlistSharePref);
    playlist.clear();
    if (!getPlayListString.isEmptyOrNull) {
      playlist.value = (jsonDecode(getPlayListString) as List<dynamic>)
          .map<ResPlaylistModel>((e) => ResPlaylistModel.fromJson(e))
          .toList();
    }
  }

  void setLikeMusic(String id) {
    if (detailMusic != null) {
      // List<ResMusicModel> lisLiketMusic =
      //     like.map((e) => e.copyWith()).toList();
      // lisLiketMusic.add(detailMusic!);
      // like.value = lisLiketMusic;
      // setValue(likeSharePref, jsonEncode(like));

      var listMusic = getMusicListFromSharePref();
      int indexMusic = listMusic.indexWhere(((e) => e.id == detailMusic?.id));

      List<ResMusicDataModel> newlistMusic = listMusic;
      newlistMusic[indexMusic] = newlistMusic[indexMusic].copyWith(idLike: id);
      setValue(musicListLocal, jsonEncode(newlistMusic));
      if (id == "1") {
        toast("Added to like song");
      } else {
        toast("Unlike success");
      }
      Get.find<HomeController>().getMusicList();
    }
  }

  void setMusicToPlaylist(ResPlaylistModel itemList) {
    if (detailMusic != null) {
      // DasboardController controllerDasboard = Get.put(DasboardController());

      var listMusic = getMusicListFromSharePref();
      int indexMusic = listMusic.indexWhere(((e) => e.id == detailMusic?.id));

      List<ResMusicDataModel> newlistMusic = listMusic;
      newlistMusic[indexMusic] =
          newlistMusic[indexMusic].copyWith(idPlayList: itemList.idPlayList);
      setValue(musicListLocal, jsonEncode(newlistMusic));

      int index =
          playlist.indexWhere((e) => e.idPlayList == itemList.idPlayList);
      playlist[index] =
          playlist[index].copyWith(image: detailMusic?.imageLagu.validate());
      setValue(playlistSharePref, jsonEncode(playlist));

      Get.back();

      // Get.to(
      //   PlayerViewDasboard(
      //     // listSound: playlist[index].listMusic,
      //     statusPlay: StatusToPlay.PLAYLIST,
      //     id: playlist[index].idPlayList,
      //     playlistModel: playlist[index],
      //   ),
      //   opaque: false,
      // );
      toast("Added to playlist");
      Get.find<HomeController>().getPlaylist();
    }
  }

  void createPlayList() {
    if (addPlaylistformKey.currentState!.validate()) {
      var abc = ResPlaylistModel(
          idPlayList:
              "playlist-${playlistTextController.text.toLowerCase().addRondomNumber}",
          namePlayList: playlistTextController.text,
          image: "");
      playlist.add(abc);

      setValue(playlistSharePref, jsonEncode(playlist));
      playlistTextController.clear();
      getPlaylist();
      // HomeController? homeController = Get.put(HomeController());
      Get.find<HomeController>().getPlaylist();
    }
  }

  void openBottomSheetPlayList(BuildContext context) {
    Get.bottomSheet(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        isScrollControlled: true,
        Obx(
          () => playlist.isEmpty
              ? Column(
                  children: [
                    1.h.height,
                    SizedBox(
                        width: 20.w,
                        child: const Divider(
                          thickness: 4.0,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create a new playlist",
                          style: boldTextStyle(),
                        ),
                        3.h.height,
                        Form(
                          key: addPlaylistformKey,
                          child: AppTextField(
                            controller: playlistTextController,
                            autoFocus: false,
                            textFieldType: TextFieldType.NAME,
                            keyboardType: TextInputType.name,
                            errorThisFieldRequired: errorThisFieldRequired,
                            textStyle: boldTextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                            // labelText: "Description Menu",
                            onFieldSubmitted: (e) {
                              createPlayList();
                            },
                            decoration: inputDecoration(context,
                                hintText: "Add Playlist",
                                fillColor:
                                    Theme.of(context).colorScheme.background,
                                borderColor: Colors.transparent),
                          ).paddingSymmetric(
                              horizontal: defaultPaddingHorizontalGlobal),
                        ),
                        3.h.height,
                        AppButtonWidget(
                          onTap: () {
                            createPlayList();
                          },
                          width: 50.w,
                          text: "Create",
                          loading: false,
                          color: Theme.of(context).colorScheme.surface,
                          textStyle: boldTextStyle(
                              color: Theme.of(context).colorScheme.background),
                          enableScaleAnimation: false,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: radius(defaultButtonRadius)),
                        ),
                      ],
                    ).expand(),
                  ],
                ).withHeight(90.h)
              : SizedBox(
                  height: 90.h,
                  child: Column(
                    children: [
                      1.h.height,
                      SizedBox(
                          width: 20.w,
                          child: const Divider(
                            thickness: 4.0,
                          )),
                      3.h.height,
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Obx(() => Column(
                              children: playlist
                                  .map((element) => ItemPlayListWidget(
                                        itemPlayList: element,
                                        functionItem: (e) =>
                                            setMusicToPlaylist(e),
                                      ))
                                  .toList(),
                            )),
                      ),
                    ],
                  ).paddingSymmetric(
                      horizontal: defaultPaddingHorizontalGlobal),
                ),
        ));
  }

  setCacheAfterDelete(String idMusic) async {
    var listMusic = getMusicListFromSharePref();
    int indexMusic = listMusic.indexWhere(((e) => e.id == idMusic));

    List<ResMusicDataModel> newlistMusic = listMusic;
    newlistMusic.removeAt(indexMusic);
    setValue(musicListLocal, jsonEncode(newlistMusic));
    HomeController controllerHome = Get.put(HomeController());
    controllerHome.getMusicList();
  }

  Future<bool> delFile(String idMusic) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String f = '$dir/$idMusic.mp3';

    try {
      final file = File(f);
      await file.delete();
      toast("Deleted successfully");
      setCacheAfterDelete(idMusic);
      return true;
    } catch (e) {
      toast("Failed to delete file");
    }
    return false;
  }
}
