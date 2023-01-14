import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/models/actor.dart';
import 'package:riverpodv2/models/actordetail.dart';
import 'package:riverpodv2/models/moviecast.dart';
import 'package:riverpodv2/utils/readconfig.dart';
import 'package:riverpodv2/utils/base.dart';

final actorProvider =
    Provider((ref) => ActorRepo(dio: Dio(), api: Config.getAPIConfig()));

class ActorRepo {
  Dio dio;
  APIConfig api;
  ActorRepo({required this.dio, required this.api});

  Future<List<Actor>> populars() async {
    final resp = await dio.get(popularActorsURL, queryParameters: {
      "api_key": api.key,
      "language": "en-US",
      "page": 1,
    });
    List<Actor> actors = [];
    actors = List<dynamic>.from(resp.data['results'])
        .map((e) => Actor.fromJson(e))
        .toList();
    return actors;
  }

  Future<ActorDetail> actorDetial(int id) async {
    final resp = await dio.get("$baseActorURL/$id", queryParameters: {
      "api_key": api.key,
      "language": "en-US",
    });
    ActorDetail d = ActorDetail.fromJson(resp.data);
    return d;
  }

  Future<List<MovieCast>> moviesCastByPerson(int id) async {
    final resp =
        await dio.get("$baseActorURL/$id/combined_credits", queryParameters: {
      "api_key": api.key,
      "language": "en-US",
    });
    List<MovieCast> mc = [];

    mc = List<Map<String, dynamic>>.from(resp.data['cast'])
        .map((e) => MovieCast.fromJson(e))
        .where((element) => element.backdropPath != null)
        .toList();

    return mc;
  }
}
