import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:nba/data/models/responses/player_detail_response.dart';
import 'package:nba/data/models/responses/team_detail_response.dart';
import 'package:nba/data/network.dart';
import 'package:nba/data/interceptors/interceptors.dart';
import 'package:nba/data/models/models.dart';

class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            AuthorizationInterceptor(),
            LoggerInterceptor(),
          ]);

  late final Dio _dio;

  Future<PlayerListResponse?> getPlayers({required int offset}) async {
    try {
      final response = await _dio.get(
        Endpoints.playersList,
        queryParameters: {
          'cursor': offset,
          'per_page': Endpoints.defaultPageSize,
          },
        );
      return PlayerListResponse.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = ApiException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<PlayerDetailResponse?> getPlayerDetail({required int playerId}) async {
    try {
      final response = await _dio.get(
        Endpoints.playerDetail+playerId.toString(),
      );
      return PlayerDetailResponse.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = ApiException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<TeamDetailResponse?> getTeamDetail({required int teamId}) async {
    try {
      final response = await _dio.get(
        Endpoints.teamDetail+teamId.toString(),
      );
      return TeamDetailResponse.fromJson(response.data);
    } on DioException catch (err) {
      final errorMessage = ApiException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}