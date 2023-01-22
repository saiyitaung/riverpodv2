import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:riverpodv2/models/moviedetail.dart';

final favoriteMovieBox = Hive.box<MovieDetail>("favoritemovies");
final favoriteMoviesStateNotifierProvider = StateNotifierProvider<FavoriteMovieStateNotitier,List<MovieDetail>>((ref) {
  return FavoriteMovieStateNotitier(favoriteMovieBox.values.toList());
});

class FavoriteMovieStateNotitier extends StateNotifier<List<MovieDetail>> {
  FavoriteMovieStateNotitier(super.state);
  void addToFavorite(MovieDetail m) {
    state = [...state,m];
    favoriteMovieBox.put(m.id, m);
  }

  void removeFromFavorite(MovieDetail m) {
    //final index = state.indexOf(m);
    state = [
      for (final s in state)
        if (s.id != m.id) s
    ];
    favoriteMovieBox.delete(m.id);
  }
}
