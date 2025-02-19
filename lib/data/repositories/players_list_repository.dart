import 'package:nba/data/models/to/player_to.dart';
import 'package:nba/data/network.dart';

class PlayersListRepository {
    final DioClient _dio = DioClient();
    int cursor = 0;

    Future<List<PlayerTO>> initLoadPlayers() async {
        cursor = 0;
        return _getPlayersListPage();
    }

    Future<List<PlayerTO>> loadNexPage() async {
        return _getPlayersListPage();
    }

    Future<List<PlayerTO>> _getPlayersListPage() async {
        try {
            final response = await _dio.getPlayers(offset: cursor);
            cursor = response?.meta.nextCurcor ?? 0;
            return response?.data ?? [];
        } catch (e) {
            rethrow;
        }
    }
}