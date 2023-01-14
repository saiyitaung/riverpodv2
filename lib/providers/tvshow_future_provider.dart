
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/services/tvshow_repo.dart';

final topRatedTVShowFutureProvider = FutureProvider((ref){
  final topRatedTVRef = ref.watch(topRatedTVShowProvider);
  return topRatedTVRef.topRated();
}
);

final tvDetailFutureProvider = FutureProvider.family((ref,int tvShowID){
  final detailRef = ref.watch(topRatedTVShowProvider);
  return detailRef.tvShowDetail(tvShowID);
});

final castsByTvShowFutureProvider = FutureProvider.family((ref,int tvShowId){
  final castRef = ref.watch(topRatedTVShowProvider);
  return castRef.getCastsByTvShowID(tvShowId);
});

final similarTvShowsFutureProvider = FutureProvider.family((ref,int tvShowID){
final castRef = ref.watch(topRatedTVShowProvider);
  return castRef.similarTvShow(tvShowID);
});