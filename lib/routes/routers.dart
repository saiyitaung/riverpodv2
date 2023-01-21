import 'package:go_router/go_router.dart';
import 'package:riverpodv2/ui/about_ui.dart';
import 'package:riverpodv2/ui/actor_detail.dart';
import 'package:riverpodv2/ui/actors_ui.dart';
import 'package:riverpodv2/ui/favorite_ui.dart';
import 'package:riverpodv2/ui/movie_detail.dart';
import 'package:riverpodv2/ui/movie_home.dart';
import 'package:riverpodv2/ui/movie_ui.dart';
import 'package:riverpodv2/ui/tvshow_detail.dart';
import 'package:riverpodv2/ui/tvshow_ui.dart';
import 'package:riverpodv2/ui/watch_list_ui.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const MovieHome(), routes: [
    GoRoute(path: movies, builder: (context, state) => MoviesUI(), routes: [
      GoRoute(
        path: ":id",
        builder: (context, state) => MovieDetailUI(
          movieId: int.parse(state.params['id']!),
        ),
      )
    ]),
    GoRoute(path: tvshows, builder: (context, state) => TVShowUI(), routes: [
      GoRoute(
        path: ":id",
        builder: (context, state) => TVShowDetailUI(
          tvShowID: int.parse(state.params['id']!),
        ),
      ),
    ]),
    GoRoute(
      path: actors,
      builder: (context, state) => ActorsUI(),
      routes: [
        GoRoute(
          path: ":id",
          builder: (context, state) => ActorDetailUI(
            actorID: int.parse(state.params['id']!),
          ),
        ),
      ],
    ),
    GoRoute(
      path: favorite,
      builder: (context, state) => MyFavoriteUI(),
    ),
    GoRoute(
      path: watch,
      builder: (context, state) => WatchListUI(),
    ),
    GoRoute(
      path: about,
      builder: (context, state) => AboutUI(),
    )
  ]),
]);

const movies = "movies";
const tvshows = "tvshows";
const actors = "actors";
const favorite = "favorite";
const watch = "watchlist";
const about = "about";
