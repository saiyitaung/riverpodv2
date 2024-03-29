import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/models/cast.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/models/moviedetail.dart';
import 'package:riverpodv2/utils/readconfig.dart';
import 'package:riverpodv2/utils/base.dart';

final moviesProvider =
    Provider((ref) => MovieRepository(dio: Dio(), api: Config.getAPIConfig()));

class MovieRepository {
  Dio dio;
  APIConfig api;
  MovieRepository({required this.dio, required this.api});
  Future<List<Movie>> search(String q) async {
    final resp = await dio.get("$searchMovieURL", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "include_adult": false,
      "page": "1",
      "query": q
    });

    List<Movie> movies = [];
    movies = List<dynamic>.from(resp.data['results'])
        .map((e) => Movie.fromJson(e))
        .where((element) => element.backdropPath != null)
        .toList();
    return movies;
  }

  Future<List<Movie>> populars() async {
    final resp = await dio.get("$baseURL/popular", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "2"
    });
    List<Movie> movies = [];
    for (final m in resp.data['results']) {
      movies.add(Movie.fromJson(m));
    }
    // print(movies.length);
    return movies;
  }

  Future<List<Movie>> nowPlaying() async {
    final resp = await dio.get("$baseURL/now_playing", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    final movies = List<dynamic>.from(resp.data['results'])
        .map((e) => Movie.fromJson(e))
        .toList();
    return movies;
  }

  // return First trailer from results
  Future<String> youtubeTrailerKey(int movieID) async {
    final resp = await dio.get("$baseURL/$movieID/videos", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
    });
    String k = List<dynamic>.from(resp.data['results'])
        .where((element) => element['official'] == true)
        .map((e) => e['key'])
        .first
        .toString();
    
    return k;
  }

  Future<List<Movie>> topRated() async {
    final resp = await dio.get("$baseURL/top_rated", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    final movies = List<dynamic>.from(resp.data['results'])
        .map((e) => Movie.fromJson(e))
        .where((element) => element.backdropPath != null)
        .toList();
    return movies;
  }

  Future<List<Movie>> upComming() async {
    final resp = await dio.get("$baseURL/upcoming", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    final movies = List<dynamic>.from(resp.data['results'])
        .map((e) => Movie.fromJson(e))
        .where((element) => element.backdropPath != null)
        .toList();
    return movies;
  }

  Future<List<Movie>> similarMovies(int id) async {
    final resp = await dio.get("$baseURL/$id/similar", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    List<Movie> movies = [];
    movies = List<dynamic>.from(resp.data['results'])
        .map((e) => Movie.fromJson(e))
        .toList();

    return movies;
  }

  Future<List<Cast>> getCastsBytMovieID(int id) async {
    final resp = await dio.get("$baseURL/$id/credits", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    List<Cast> casts = [];
    casts = List<dynamic>.from(resp.data['cast'])
        .map((e) => Cast.fromJson(e))
        .toList();
    return casts;
  }

  Future<MovieDetail> movieDetail(int id) async {
    final resp = await dio.get("$movieDetailURL/$id", queryParameters: {
      "api_key": api.key ?? "",
      "language": "en-US",
      "page": "1"
    });
    return MovieDetail.fromJson(resp.data);
  }
}
