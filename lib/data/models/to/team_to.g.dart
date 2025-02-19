// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamTO _$TeamTOFromJson(Map<String, dynamic> json) => TeamTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      city: json['city'] as String?,
      abbreviation: json['abbreviation'] as String?,
      conference: json['conference'] as String?,
      division: json['division'] as String?,
    );

Map<String, dynamic> _$TeamTOToJson(TeamTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'city': instance.city,
      'abbreviation': instance.abbreviation,
      'conference': instance.conference,
      'division': instance.division,
    };
