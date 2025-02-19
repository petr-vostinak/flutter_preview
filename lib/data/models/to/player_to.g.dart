// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerTO _$PlayerTOFromJson(Map<String, dynamic> json) => PlayerTO(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      position: json['position'] as String?,
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      jerseyNumber: json['jersey_number'] as String?,
      college: json['college'] as String?,
      country: json['country'] as String?,
      draftYear: (json['draft_year'] as num?)?.toInt(),
      draftRound: (json['draft_round'] as num?)?.toInt(),
      draftNumber: (json['draft_number'] as num?)?.toInt(),
      team: json['team'] == null
          ? null
          : TeamTO.fromJson(json['team'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerTOToJson(PlayerTO instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': instance.position,
      'height': instance.height,
      'weight': instance.weight,
      'jersey_number': instance.jerseyNumber,
      'college': instance.college,
      'country': instance.country,
      'draft_year': instance.draftYear,
      'draft_round': instance.draftRound,
      'draft_number': instance.draftNumber,
      'team': instance.team,
    };
