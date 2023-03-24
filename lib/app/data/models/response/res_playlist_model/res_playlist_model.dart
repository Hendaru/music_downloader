import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_download_youtube/app/data/models/response/res_music_model/res_music_model.dart';

part 'res_playlist_model.freezed.dart';
part 'res_playlist_model.g.dart';

@freezed
class ResPlaylistModel with _$ResPlaylistModel {
  factory ResPlaylistModel(
      {String? idPlayList,
      String? namePlayList,
      String? image,
      @Default([]) List<ResMusicDataModel> listMusic}) = _ResPlaylistModel;

  factory ResPlaylistModel.fromJson(Map<String, dynamic> json) =>
      _$ResPlaylistModelFromJson(json);
}
