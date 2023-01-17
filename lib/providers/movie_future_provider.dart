
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/services/movie_repo.dart';
import 'package:riverpodv2/utils/readconfig.dart';
 

final popularsMovieFutureProvider = FutureProvider((ref){
  final movieRef= ref.watch(moviesProvider);
  return movieRef.populars();
});

final upCommingMovieFutureProvider= FutureProvider((ref){
  final movieRef = ref.watch(moviesProvider);
  return movieRef.upComming();
});
final topRatedMovieFutureProvider = FutureProvider((ref){
  final movieRef = ref.watch(moviesProvider);
  return movieRef.topRated();
});
final nowplayingMoiveFutureProvider = FutureProvider((ref){
  final movieRef = ref.watch(moviesProvider);
  return movieRef.nowPlaying();
});

final searchMovieFutureProvider = FutureProvider.family((ref,String q){
  final movieRef = ref.watch(moviesProvider);
  return movieRef.search(q);
});

final movieIdFutureProvider = FutureProvider.family((ref,int movieID){
  final movieRef = ref.watch(moviesProvider);
  return movieRef.youtubeTrailerKey(movieID);
});

final movieDetailFutureProvider = FutureProvider.family((ref,int movieID){
  final movieRef = ref.watch(moviesProvider);
  return movieRef.movieDetail(movieID);
});

final similarMoviesFutureProvider = FutureProvider.family((ref,int movieId){
  final movieRef= ref.watch(moviesProvider);
  return movieRef.similarMovies(movieId);
});

final castsFutureProvider = FutureProvider.family((ref,int movieId){
 final movieRef= ref.watch(moviesProvider);
 return movieRef.getCastsBytMovieID(movieId);
});

