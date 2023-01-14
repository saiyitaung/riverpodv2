import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodv2/services/movie_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

void main(){
  test("Cast test", () async {
     final movieRepo=MovieRepository(dio: Dio(),api: Config.getAPIConfig());
     final casts = await movieRepo.getCastsBytMovieID(19995);
     for(final c in casts){
      print(c.originalName);
     }
  });
}