
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/services/movie_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';
 

final popularsMovieFutureProvider = FutureProvider((ref){
  final movieRef= ref.watch(popularMovieProvider);
  return movieRef.populars();
});

final upCommingMovieFutureProvider= FutureProvider((ref){
  final movieRef = ref.watch(upCommingMovieProvider);

  return movieRef.upComming();
});

final movieDetailFutureProvider = FutureProvider.family((ref,int movieID){
  final movieRef = MovieRepository(dio:Dio(),api: Config.getAPIConfig());
  return movieRef.movieDetail(movieID);
});

final similarMoviesFutureProvider = FutureProvider.family((ref,int movieId){
  final movieRef= MovieRepository(dio: Dio(),api: Config.getAPIConfig());
  return movieRef.similarMovies(movieId);
});

final castsFutureProvider = FutureProvider.family((ref,int movieId){
 final movieRef= MovieRepository(dio: Dio(),api: Config.getAPIConfig());
 return movieRef.getCastsBytMovieID(movieId);
});