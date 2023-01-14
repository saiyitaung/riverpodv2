import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/components/actor_card.dart';
import 'package:riverpodv2/components/carousel_box.dart';
import 'package:riverpodv2/components/movie_card.dart';
import 'package:riverpodv2/components/tvshow_card.dart';
import 'package:riverpodv2/models/actor.dart';
import 'package:riverpodv2/providers/actors_future_provider.dart';
import 'package:riverpodv2/providers/movie_future_provider.dart';
import 'package:riverpodv2/providers/tvshow_future_provider.dart';
import 'package:riverpodv2/ui/actor_detail.dart';
import 'package:riverpodv2/ui/movie_detail.dart';
import 'package:riverpodv2/ui/tvshow_detail.dart';
import 'package:riverpodv2/utils/myutils.dart';

class MovieHome extends ConsumerWidget {
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesRef = ref.watch(upCommingMovieFutureProvider);
    final popularRef = ref.watch(popularsMovieFutureProvider);
    final topRatedTVShows = ref.watch(topRatedTVShowFutureProvider);
    final popularActorsRef = ref.watch(popularActorsFutureProvider);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Movies Demo"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade600,
              child: FlutterLogo(),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.watch(upCommingMovieFutureProvider.future);
            ref.watch(popularsMovieFutureProvider.future);
          },
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming movies".toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(onPressed: () {}, child: Text("more"))
                ],
              ),
            ),
            SizedBox(
              height: size.height * .27,
              width: size.width,
              child: moviesRef.when(data: (data) {
                debugPrint('${data[0].id}');
                return CarouselSlider(
                    items: data
                        .map((e) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            MovieDetailUI(movieId: e.id))));
                              },
                              child: CarouselBox(
                                movie: e,
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      aspectRatio: 1,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: null,
                      scrollDirection: Axis.vertical,
                    ));
              }, error: (e, st) {
                debugPrint(e.toString());
                debugPrint("${st.toString()}");
                return const Center(
                  child: Text("Oop!"),
                );
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "popular movie".toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextButton(onPressed: () {}, child: Text("more"))
                ],
              ),
            ),
            SizedBox(
              height: size.height * .37,
              child: popularRef.when(data: (data) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    MovieDetailUI(movieId: data[index].id))));
                      },
                      child: MovieCard(movie: data[index]),
                    );
                  },
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                );
              }, error: (e, _) {
                return const Center(
                  child: Text("Oop!"),
                );
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TV Show".toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(onPressed: () {}, child: Text("more"))
                ],
              ),
            ),
            SizedBox(
              height: size.height * .37,
              child: topRatedTVShows.when(data: (data) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => TVShowDetailUI(
                                        tvShowID: data[index].id,
                                      ))));
                        },
                        child: TVShowCard(tvShow: data[index]));
                  },
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                );
              }, error: (e, _) {
                return Center(
                  child: Text("Oop!"),
                );
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "popular Actors & Actress".toUpperCase(),
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(onPressed: () {}, child: Text("more"))
                ],
              ),
            ),
            Container(
              height: 150,
              child: popularActorsRef.when(data: (data) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ActorDetailUI(
                                        actor: Actor(
                                            profilePath:
                                                data[index].profilePath,
                                            id: data[index].id,
                                            name: data[index].name,
                                            adult: data[index].adult,
                                            popularity: data[index].popularity),
                                      ))));
                        },
                        child: ActorCard(
                          actor: data[index],
                        ));
                  },
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                );
              }, error: (e, _) {
                return Center(
                  child: Text("Oop!"),
                );
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ]),
        ),
      ),
      drawer: Drawer(
        child: Container(
            child: Column(
          children: [Text("Menu")],
        )),
      ),
    );
  }
}
