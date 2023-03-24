import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_download_youtube/app/utils/app_button.dart';
import 'package:music_download_youtube/app/utils/app_common.dart';
import 'package:music_download_youtube/app/utils/app_constants.dart';
import 'package:music_download_youtube/app/utils/app_decoration.dart';
import 'package:music_download_youtube/app/utils/app_text_style.dart';
import 'package:music_download_youtube/app/utils/callback.dart';
import 'package:music_download_youtube/app/utils/extensions/app_text_field.dart';
import 'package:music_download_youtube/app/utils/extensions/widget_extensions.dart';
import 'package:music_download_youtube/app/utils/widgets/create_playlist_widget/add_play_list_controller.dart';
import 'package:sizer/sizer.dart';

class AddPlayListWidget extends GetView<AddPlayListController> {
  const AddPlayListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AddPlayListController>(() => AddPlayListController());
    return Column(
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
              key: controller.addPlaylistformKey,
              child: AppTextField(
                controller: controller.playlistTextController,
                autoFocus: false,
                textFieldType: TextFieldType.NAME,
                keyboardType: TextInputType.name,
                errorThisFieldRequired: errorThisFieldRequired,
                textStyle: boldTextStyle(
                    color: Theme.of(context).colorScheme.onSecondary),
                // labelText: "Description Menu",
                onFieldSubmitted: (e) {
                  controller.createPlayList();
                },
                decoration: inputDecoration(context,
                    hintText: "Add Playlist",
                    fillColor: Theme.of(context).colorScheme.background,
                    borderColor: Colors.transparent),
              ).paddingSymmetric(horizontal: defaultPaddingHorizontalGlobal),
            ),
            3.h.height,
            AppButtonWidget(
              onTap: () {
                controller.createPlayList();
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
    );
  }
}
