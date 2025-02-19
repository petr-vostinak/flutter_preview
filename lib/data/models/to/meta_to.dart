import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_to.g.dart';

@JsonSerializable()
class MetaTO extends Equatable {
const MetaTO({
    required this.nextCurcor,
    required this.perPage,
  });

  factory MetaTO.fromJson(Map<String, dynamic> json) => _$MetaTOFromJson(json);

  Map<String, dynamic> toJson() => _$MetaTOToJson(this);

  // Cursor for next page
  @JsonKey(name: 'next_cursor')
  final int  nextCurcor;
  @JsonKey(name: 'per_page')
  // Items per page
  final int perPage;

  @override
  bool? get stringify => true;
  
  @override
  List<Object?> get props => [nextCurcor, perPage];
}