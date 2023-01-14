import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodv2/services/movie_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

void main(){
  test("Movie Detail", () async{
    final movieRepo=MovieRepository(dio: Dio(),api: Config.getAPIConfig());
    final movieDetail =await movieRepo.movieDetail(550);
    print(movieDetail.backdropPath);
  });
}