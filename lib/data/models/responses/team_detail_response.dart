import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba/data/models/models.dart';

part 'team_detail_response.g.dart';

@JsonSerializable()
class TeamDetailResponse extends Equatable {
  const TeamDetailResponse({
    required this.data,
  });

  factory TeamDetailResponse.fromJson(Map<String, dynamic> json) => _$TeamDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeamDetailResponseToJson(this);

  // Detail of team
  final TeamTO data;

  @override
  bool? get stringify => true;
  
  @override
  List<Object?> get props => [data];
}