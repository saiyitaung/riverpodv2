import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/models/cast.dart';
import 'package:riverpodv2/models/tvshow.dart';
import 'package:riverpodv2/models/tvshowdetail.dart';
import 'package:riverpodv2/utils/readconfig.dart';
import 'package:riverpodv2/utils/base.dart';

final tvShowProvider =
    Provider((ref) => TVShowRepo(dio: Dio(), apiConfig: Config.getAPIConfig()));

class TVShowRepo {
  Dio dio;
  APIConfig apiConfig;
  TVShowRepo({required this.dio, required this.apiConfig});
  Future<List<TVShow>> topRated() async {
    final resp = await dio.get(topRatedTVShow, queryParameters: {
      "api_key": apiConfig.key,
      "language": "en-US",
      "page": "1"
    });
    List<TVShow> topRated = [];
    topRated = List<dynamic>.from(resp.data['results'])
        .map((e) => TVShow.fromJson(e))
        .toList();

    return topRated;
  }
  Future<List<TVShow>> popular() async {
    final resp = await dio.get("$baseTvURL/popular", queryParameters: {
      "api_key": apiConfig.key,
      "language": "en-US",
      "page": "1"
    });
    List<TVShow> topRated = [];
    topRated = List<dynamic>.from(resp.data['results'])
        .map((e) => TVShow.fromJson(e))
        .where((element) => element.backdropPath != null)
        .toList();

    return topRated;
  }
 Future<List<TVShow>> upComing() async {
    final resp = await dio.get(topRatedTVShow, queryParameters: {
      "api_key": apiConfig.key,
      "language": "en-US",
      "page": "2"
    });
    List<TVShow> topRated = [];
    topRated = List<dynamic>.from(resp.data['results'])
        .map((e) => TVShow.fromJson(e))
        .toList();

    return topRated;
  }
Future<List<TVShow>> nowPlaying() async {
    final resp = await dio.get(topRatedTVShow, queryParameters: {
      "api_key": apiConfig.key,
      "language": "en-US",
      "page": "1"
    });
    List<TVShow> topRated = [];
    topRated = List<dynamic>.from(resp.data['results'])
        .map((e) => TVShow.fromJson(e))
        .toList();

    return topRated;
  }

  Future<List<Cast>> getCastsByTvShowID(int tvShowID) async {
    final resp = await dio.get("${baseTvURL}/$tvShowID/credits",queryParameters: {
      "api_key": apiConfig.key,
      "language": "en-US",
    });
    List<Cast> casts=[];
    casts = List<dynamic>.from(resp.data['cast']).map((e) => Cast.fromJson(e)).toList();

    return casts;
  }
  Future<TVShowDetail> tvShowDetail(int movieID) async {
    final resp = await dio.get("${baseTvURL}/$movieID",queryParameters: {
      "api_key": apiConfig.key,
      "language": "en-US"
    });
    TVShowDetail d = TVShowDetail.fromJson(resp.data);

    return d;
  }
  Future<List<TVShow>> similarTvShow(int id) async {
    final resp = await dio.get("${baseTvURL}/$id/similar", queryParameters: {
      "api_key": apiConfig.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    List<TVShow> tvshows=[];
    tvshows = List<dynamic>.from(resp.data['results']).map((e) => TVShow.fromJson(e)).toList();

    return tvshows;
  }
}
