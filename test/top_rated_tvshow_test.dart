
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodv2/services/tvshow_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

void main(){
  test("Top Rated TV Show", () async{
    final tvShows= await TVShowRepo(dio: Dio(),apiConfig: Config.getAPIConfig()).topRated();
    for(final tvShow in tvShows){
      print("${tvShow.name}  : ${tvShow.voteAverage}");
    }
  });
}