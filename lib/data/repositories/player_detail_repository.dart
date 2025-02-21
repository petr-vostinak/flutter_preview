import 'package:nba/data/models/to/player_to.dart';
import 'package:nba/data/network.dart';

class PlayerDetailRepository {
  final DioClient _dio = DioClient();

  Future<PlayerTO?> getPlayerDetail(int playerId) async {
    try {
      final response = await _dio.getPlayerDetail(playerId: playerId);
      return response?.data;
    } catch (e) {
      rethrow;
    }
  }
}