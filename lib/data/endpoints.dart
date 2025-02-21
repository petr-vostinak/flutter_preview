class Endpoints {
  Endpoints._();

  static const String baseURL = 'https://api.balldontlie.io';

  static const Duration receiveTimeout = Duration(milliseconds:30 * 1000);

  static const Duration connectionTimeout = Duration(milliseconds: 30 * 1000);

  static const int defaultPageSize = 35;

  static const String playersList = '/v1/players';

  static const String playerDetail = '/v1/players/';

  static const String teamDetail = '/v1/teams/';
}