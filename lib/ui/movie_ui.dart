import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpodv2/components/movie_vartical_card.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/providers/genres_future_provider.dart';
import 'package:riverpodv2/providers/movie_future_provider.dart';
import 'package:riverpodv2/providers/movies_state_notifier.dart';
import 'package:riverpodv2/services/genre_repo.dart';
import 'package:riverpodv2/ui/movie_detail.dart';

class MoviesUI extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genresRef = ref.watch(genresFutureProvider);
    final movieStateRef = ref.watch(movieStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        elevation: 0,
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        ref
                            .read(movieStateNotifierProvider.notifier)
                            .change(MovieState.upcoming);
                      },
                      child: Text("UP COMMINNG",
                      style: TextStyle(color: movieStateRef == MovieState.upcoming ? Colors.white :null),
                      )),
                  TextButton(
                      onPressed: () {
                        ref
                            .read(movieStateNotifierProvider.notifier)
                            .change(MovieState.popular);
                      },
                      child: Text("Popular ",
                      style: TextStyle(color: movieStateRef == MovieState.popular ? Colors.white :null),)),
                  TextButton(
                      onPressed: () {
                        ref
                            .read(movieStateNotifierProvider.notifier)
                            .change(MovieState.nowplaying);
                      },
                      child: Text("Now Playing",
                      style: TextStyle(color: movieStateRef == MovieState.nowplaying ? Colors.white :null),
                      )),
                  TextButton(
                      onPressed: () {
                        ref
                            .read(movieStateNotifierProvider.notifier)
                            .change(MovieState.topRated);
                      },
                      child: Text("Top Rated",
                      style: TextStyle(color: movieStateRef == MovieState.topRated ? Colors.white :null),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: genresRef.when(data: (genres) {
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    return Chip(label: Text(genres[index].name.toString()));
                  }),
                  itemCount: genres.length,
                  scrollDirection: Axis.horizontal,
                );
              }, error: (e, _) {
                return const Text("Oop!");
              }, loading: () {
                return const CircularProgressIndicator();
              }),
            ),
            ...buildMovieCard(ref, getFutureProvider(movieStateRef)),
          ],
        ),
      ),
    );
  }

  FutureProvider<List<Movie>> getFutureProvider(MovieState state) {
    switch (state) {
      case MovieState.upcoming:
        return upCommingMovieFutureProvider;
      case MovieState.nowplaying:
        return nowplayingMoiveFutureProvider;
      case MovieState.topRated:
        return topRatedMovieFutureProvider;
      case MovieState.popular:
        return popularsMovieFutureProvider;
    }
  }

  List<Widget> buildMovieCard(WidgetRef ref, FutureProvider<List<Movie>> fp) {
    final upCommingRef = ref.watch(fp);
    List<Widget> widgets = [];
    upCommingRef.when(data: (movies) {
      widgets =
          movies.map((e) => InkWell(onTap: () {
            Navigator.push(ref.context, MaterialPageRoute(builder: ((context) => 
            MovieDetailUI(movieId: e.id))
            ));
          },child: MovieVarticalCard(movie: e, width: 500))).toList();
    }, error: (e, st) {
      return widgets.add(const Text("Oop"));
    }, loading: () {
      return widgets.add(const CircularProgressIndicator());
    });

    return widgets;
  }
}
