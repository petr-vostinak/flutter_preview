import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba/data/models/models.dart';

part 'player_detail_response.g.dart';

@JsonSerializable()
class PlayerDetailResponse extends Equatable {
  const PlayerDetailResponse({
    required this.data,
  });

  factory PlayerDetailResponse.fromJson(Map<String, dynamic> json) => _$PlayerDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerDetailResponseToJson(this);

  // Detail of player
  final PlayerTO data;

  @override
  bool? get stringify => true;
  
  @override
  List<Object?> get props => [data];
}