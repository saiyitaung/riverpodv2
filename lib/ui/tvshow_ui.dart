import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/components/movie_vartical_card.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/models/tvshow.dart';
import 'package:riverpodv2/providers/genres_future_provider.dart';
import 'package:riverpodv2/providers/movies_state_notifier.dart';
import 'package:riverpodv2/providers/tvshow_future_provider.dart';
import 'package:riverpodv2/ui/tvshow_detail.dart';

class TVShowUI extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genresRef = ref.watch(genresFutureProvider);
    final movieStateRef = ref.watch(movieStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("TV Shows"),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomTvSearch());
          }, icon: Icon(Icons.search))
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

  FutureProvider<List<TVShow>> getFutureProvider(MovieState state) {
    switch (state) {
      case MovieState.upcoming:
        return upComingTVShowFutureProvider;
      case MovieState.nowplaying:
        return nowPlayingTVShowFutureProvider;
      case MovieState.topRated:
        return topRatedTVShowFutureProvider;
      case MovieState.popular:
        return popularTVShowFutureProvider;
    }
  }

  List<Widget> buildMovieCard(WidgetRef ref, FutureProvider<List<TVShow>> fp) {
    final upCommingRef = ref.watch(fp);
    List<Widget> widgets = [];
    upCommingRef.when(data: (movies) {
      widgets =
          movies.map((e) => InkWell(onTap: () {
            Navigator.push(ref.context, MaterialPageRoute(builder: ((context) => 
            TVShowDetailUI(tvShowID: e.id))
            ));
          },child: MovieVarticalCard(movie: Movie.fromTvShow(e), width: 500))).toList();
    }, error: (e, st) {
      return widgets.add(const Text("Oop"));
    }, loading: () {
      return widgets.add(const CircularProgressIndicator());
    });

    return widgets;
  }
}


class CustomTvSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
     return [
      IconButton(onPressed: (){
        query = '';
      }, icon: Icon(Icons.clear))
     ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
     return IconButton(onPressed: (){
      close(context, null);
     }, icon: Icon(Icons.arrow_back_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
     return Container(
      child: Consumer(builder: (context, ref, child) {
        final size = MediaQuery.of(context).size;
        final searchRef = ref.watch(searchTvShowsFutureProvider(query));
        return Container(
          child: searchRef.when(data: (movies) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  TVShowDetailUI(tvShowID: movies[index].id))));
                    },
                    child: MovieVarticalCard(
                        movie: Movie.fromTvShow(movies[index]), width: size.width));
              },
              itemCount: movies.length,
            );
          }, error: (e, st) {
           
            return const Center(child: Text("Empty!"),);
          }, loading: () {
            return Center(child:const CircularProgressIndicator());
          }),
        );
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     return Container(
      child: Consumer(builder: (context, ref, child) {
        final size = MediaQuery.of(context).size;
        final searchRef = ref.watch(searchTvShowsFutureProvider(query));
        return Container(
          child: searchRef.when(data: (movies) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  TVShowDetailUI(tvShowID: movies[index].id))));
                    },
                    child: MovieVarticalCard(
                        movie: Movie.fromTvShow(movies[index]), width: size.width));
              },
              itemCount: movies.length,
            );
          }, error: (e, st) {
            
            return const Center(child:Text("Empty!"));
          }, loading: () {
            return const Center(child:   CircularProgressIndicator());
          }),
        );
      }),
    );
  }

}