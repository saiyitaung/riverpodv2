import 'package:flutter/material.dart';
 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
 
import 'package:riverpodv2/components/movie_vartical_card.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/models/moviedetail.dart';
import 'package:riverpodv2/providers/movie_watch_list_state_notifier.dart';

class WatchListUI extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Watch list"),
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<MovieDetail>("moviewatchlist").listenable(),
          builder: (context, value, child) {
            final movies = value.values.toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () =>
                      GoRouter.of(context).go("/movies/${movies[index].id}"),
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Delete?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancal")),
                              TextButton(
                                  onPressed: () {
                                    ref
                                        .read(
                                            movieWatchListStateNotifierProvider
                                                .notifier)
                                        .remove(movies[index]);
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"))
                            ],
                          );
                        });
                  },
                  child: MovieVarticalCard(
                      movie: Movie(
                          id: movies[index].id,
                          originalLanguage: movies[index].originalLanguage,
                          originalTitle: movies[index].originalTitle,
                          overview: movies[index].overview ?? "",
                          popularity: movies[index].popularity,
                          adult: movies[index].adult,
                          backdropPath: movies[index].backdropPath,
                          genreIds:
                              movies[index].genres.map((e) => e.id).toList(),
                          title: movies[index].title,
                          video: movies[index].video,
                          voteAverage: movies[index].voteAverage,
                          votecount: movies[index].voteCount),
                      width: MediaQuery.of(context).size.width),
                );
              },
              itemCount: movies.length,
            );
          },
        ));
  }
}
