// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'res_playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResPlaylistModel _$$_ResPlaylistModelFromJson(Map<String, dynamic> json) =>
    _$_ResPlaylistModel(
      idPlayList: json['idPlayList'] as String?,
      namePlayList: json['namePlayList'] as String?,
      image: json['image'] as String?,
      listMusic: (json['listMusic'] as List<dynamic>?)
              ?.map(
                  (e) => ResMusicDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ResPlaylistModelToJson(_$_ResPlaylistModel instance) =>
    <String, dynamic>{
      'idPlayList': instance.idPlayList,
      'namePlayList': instance.namePlayList,
      'image': instance.image,
      'listMusic': instance.listMusic,
    };
