
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/services/tvshow_repo.dart';

final topRatedTVShowFutureProvider = FutureProvider((ref){
  final topRatedTVRef = ref.watch(tvShowProvider);
  return topRatedTVRef.topRated();
});
final popularTVShowFutureProvider = FutureProvider((ref){
  final tvRef = ref.watch(tvShowProvider);
  return tvRef.popular();
});
final nowPlayingTVShowFutureProvider = FutureProvider((ref){
  final tvRef = ref.watch(tvShowProvider);
  return tvRef.nowPlaying();
});
final upComingTVShowFutureProvider = FutureProvider((ref) {
  final tvRef = ref.watch(tvShowProvider);
  return tvRef.upComing();
});
final searchTvShowsFutureProvider = FutureProvider.family((ref,String query){
  final tvRef =ref.watch(tvShowProvider);
  return tvRef.searchTVShows(query);
});
final tvTrailerKeyFutureProvider = FutureProvider.family((ref, int tvShowID){
  final tvRef = ref.watch(tvShowProvider);
  return tvRef.youtubeTrailerKey(tvShowID);
});

final tvDetailFutureProvider = FutureProvider.family((ref,int tvShowID){
  final detailRef = ref.watch(tvShowProvider);
  return detailRef.tvShowDetail(tvShowID);
});

final castsByTvShowFutureProvider = FutureProvider.family((ref,int tvShowId){
  final castRef = ref.watch(tvShowProvider);
  return castRef.getCastsByTvShowID(tvShowId);
});

final similarTvShowsFutureProvider = FutureProvider.family((ref,int tvShowID){
final castRef = ref.watch(tvShowProvider);
  return castRef.similarTvShow(tvShowID);
});