import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_to.g.dart';

@JsonSerializable()
class TeamTO extends Equatable {
  const TeamTO({
      required this.id,
      required this.name,
      required this.fullName,
      required this.city,
      required this.abbreviation,
      required this.conference,
      required this.division,
    });

    factory TeamTO.fromJson(Map<String, dynamic> json) => _$TeamTOFromJson(json);

    Map<String, dynamic> toJson() => _$TeamTOToJson(this);

    // Team ID
    final int id;
    // Team short name
    final String? name;
    // Team full name
    @JsonKey(name: "full_name")
    final String? fullName;
    // Team city
    final String? city;
    // Team abbreviation
    final String? abbreviation;
    // Team conference
    final String? conference;
    // Team division
    final String? division;

    @override
    bool? get stringify => true;

    @override
    List<Object?> get props => [id, name, fullName, city, abbreviation, conference, division];
}