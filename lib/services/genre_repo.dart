import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/models/genre.dart';
import 'package:riverpodv2/utils/base.dart';
import 'package:riverpodv2/utils/readconfig.dart';

class GenreRepo {
  Future<List<Genre>> getAll(APIConfig config) async {
    final resp = await Dio().get(genreListURL, queryParameters: {
      "api_key": config.key,
      "language": "en-US",
    });
    List<Genre> genreList = [];
    genreList = List<dynamic>.from(resp.data['genres'])
        .map((e) => Genre.fromJson(e))
        .toList();

    return genreList;
  }
}

final genreProvider = Provider((ref)=> GenreRepo());