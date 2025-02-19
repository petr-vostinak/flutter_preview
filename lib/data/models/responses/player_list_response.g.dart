// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerListResponse _$PlayerListResponseFromJson(Map<String, dynamic> json) =>
    PlayerListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => PlayerTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaTO.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerListResponseToJson(PlayerListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
