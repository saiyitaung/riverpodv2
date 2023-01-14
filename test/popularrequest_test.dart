
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodv2/services/genre_repo.dart';
import 'package:riverpodv2/services/movie_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';

void main(){
  final config=Config.getAPIConfig();
  final dio =Dio();
  test("get popular movies", () async{
    
    final result=await MovieRepository(dio:dio,api:config).populars();
    
    print(result[3].originalTitle);
    print(result[3].genreIds.toString());
  });
  
   test("get popular movies", () async{
    
    final result=await MovieRepository(dio:dio,api: config).nowPlaying();
    
    print(result[3].originalTitle);
    print(result[3].genreIds.toString());
  });

  test("get popular movies", () async{
    
    final result=await MovieRepository(dio:dio,api: config).upComming();
    
    print(result[3].originalTitle);
    print(result[3].genreIds.toString());
  });
   test("get genres movies", () async{
    
    print(config.key);
    final result=await GenreRepo().getAll(config);
    
    print(result);
    
  });
}