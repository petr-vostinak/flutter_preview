import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba/data/models/models.dart';

part 'player_list_response.g.dart';

@JsonSerializable()
class PlayerListResponse extends Equatable {
  const PlayerListResponse({
    required this.data,
    required this.meta,
  });

  factory PlayerListResponse.fromJson(Map<String, dynamic> json) => _$PlayerListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerListResponseToJson(this);

  // List of players
  final List<PlayerTO> data;
  // Paging metadata
  final MetaTO meta;

  @override
  bool? get stringify => true;
  
  @override
  List<Object?> get props => [data, meta];
}