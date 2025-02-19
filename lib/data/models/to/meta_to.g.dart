// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaTO _$MetaTOFromJson(Map<String, dynamic> json) => MetaTO(
      nextCurcor: (json['next_cursor'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
    );

Map<String, dynamic> _$MetaTOToJson(MetaTO instance) => <String, dynamic>{
      'next_cursor': instance.nextCurcor,
      'per_page': instance.perPage,
    };
