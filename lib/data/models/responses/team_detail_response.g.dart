// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamDetailResponse _$TeamDetailResponseFromJson(Map<String, dynamic> json) =>
    TeamDetailResponse(
      data: TeamTO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamDetailResponseToJson(TeamDetailResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
