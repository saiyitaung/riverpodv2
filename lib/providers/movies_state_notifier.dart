import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieStateNotifierProvider =
    StateNotifierProvider<MoviesStateNotifier,MovieState>((ref) => MoviesStateNotifier(MovieState.upcoming));

class MoviesStateNotifier extends StateNotifier<MovieState> {
  MoviesStateNotifier(super.state);
  void change(MovieState s) {
    state = s;
  }
}

enum MovieState {
  topRated,
  upcoming,
  nowplaying,
  popular,
}
