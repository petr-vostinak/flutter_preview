import 'package:nba/data/dio_client.dart';
import 'package:nba/data/models/to/team_to.dart';

class TeamDetailRepository {
  final DioClient _dio = DioClient();

  Future<TeamTO?> getTeamDetail(int teamId) async {
    try {
      final response = await _dio.getTeamDetail(teamId: teamId);
      return response?.data;
    } catch (e) {
      rethrow;
    }
  }
}