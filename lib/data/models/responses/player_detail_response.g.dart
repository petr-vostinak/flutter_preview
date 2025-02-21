// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerDetailResponse _$PlayerDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PlayerDetailResponse(
      data: PlayerTO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerDetailResponseToJson(
        PlayerDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
