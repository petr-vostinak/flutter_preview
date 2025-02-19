import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nba/data/models/to/team_to.dart';

part 'player_to.g.dart';

@JsonSerializable()
class PlayerTO extends Equatable {
  const PlayerTO({
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.position,
      required this.height,
      required this.weight,
      required this.jerseyNumber,
      required this.college,
      required this.country,
      required this.draftYear,
      required this.draftRound,
      required this.draftNumber,
      required this.team,
    });

    factory PlayerTO.fromJson(Map<String, dynamic> json) => _$PlayerTOFromJson(json);

    Map<String, dynamic> toJson() => _$PlayerTOToJson(this);

    // Player ID
    final int? id;
    // First name
    @JsonKey(name: 'first_name')
    final String? firstName;
    // Last name
    @JsonKey(name: 'last_name')
    final String? lastName;
    // Position
    final String? position;
    // Height
    final String? height;
    // Weight
    final String? weight;
    // Jersey number
    @JsonKey(name: 'jersey_number')
    final String? jerseyNumber;
    // College
    final String? college;
    // Country
    final String? country;
    // Draft year
    @JsonKey(name: 'draft_year')
    final int? draftYear;
    // Draft round
    @JsonKey(name: 'draft_round')
    final int? draftRound;
    // Draft number
    @JsonKey(name: 'draft_number')
    final int? draftNumber;
    // Team info
    final TeamTO? team;

    @override
    bool? get stringify => true;

    @override
    List<Object?> get props => [id,firstName,lastName,position,height,weight,jerseyNumber,college,country,draftYear,draftRound,draftNumber,team];
}