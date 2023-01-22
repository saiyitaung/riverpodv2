import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpodv2/models/moviedetail.dart';

final watchlistMovieBox = Hive.box<MovieDetail>("moviewatchlist");

final movieWatchListStateNotifierProvider =
    StateNotifierProvider<MovieWatchListStateNotifier, List<MovieDetail>>(
        (ref) {
  return MovieWatchListStateNotifier(watchlistMovieBox.values.toList());
});

class MovieWatchListStateNotifier extends StateNotifier<List<MovieDetail>> {
  MovieWatchListStateNotifier(super.state);
  void add(MovieDetail m) {
    state = [...state];
    watchlistMovieBox.put(m.id, m);
  }

  void remove(MovieDetail m) {
    state = [
      for (final s in state)
        if (s.id != m.id) s
    ];
    watchlistMovieBox.delete(m.id);
  }
}
