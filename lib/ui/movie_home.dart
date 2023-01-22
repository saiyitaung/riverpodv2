import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpodv2/components/actor_card.dart';
import 'package:riverpodv2/components/carouselslider_card.dart';
import 'package:riverpodv2/components/drawerwidget.dart';
import 'package:riverpodv2/components/movie_card.dart';
import 'package:riverpodv2/components/tvshow_card.dart';
import 'package:riverpodv2/providers/actors_future_provider.dart';
import 'package:riverpodv2/providers/logger_provider.dart';
import 'package:riverpodv2/providers/movie_future_provider.dart';
import 'package:riverpodv2/providers/network_stat_notifier_provider.dart';
import 'package:riverpodv2/providers/network_state_notifier.dart';
import 'package:riverpodv2/providers/tvshow_future_provider.dart';
import 'package:riverpodv2/ui/actor_detail.dart';
import 'package:riverpodv2/ui/movie_detail.dart';
import 'package:riverpodv2/ui/movie_ui.dart';
import 'package:riverpodv2/ui/tvshow_detail.dart';
import 'package:riverpodv2/utils/myutils.dart';

class MovieHome extends ConsumerWidget {
  const MovieHome({super.key});
  void goTo(BuildContext context, Widget place) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => place)));
  }

  void displayBanner(
      BuildContext context, NetworkStatus? previous, NetworkStatus next) {
    switch (next) {
      case NetworkStatus.off:
        ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(content: Text("Offline!"), actions: [
          TextButton(
              onPressed: () {                
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: Text("dismiss"))
        ]));
        Future.delayed(Duration(seconds: 5),() {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },);
        break;
      case NetworkStatus.on:
        if (previous == NetworkStatus.off) {
          ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(content: Text("online"), actions: [
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Text("dismiss"))
          ]));
        }
         Future.delayed(Duration(seconds: 5),() {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },);
        break;
      case NetworkStatus.unknown:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesRef = ref.watch(upCommingMovieFutureProvider);
    final popularRef = ref.watch(popularsMovieFutureProvider);
    final topRatedTVShows = ref.watch(topRatedTVShowFutureProvider);
    final popularActorsRef = ref.watch(popularActorsFutureProvider);
    final loggerRef = ref.watch(loggerProvider);
    ref.listen(netwokStateNotifierProvider, (previous, next) {
      displayBanner(context, previous, next);
      if (next == NetworkStatus.on) {
        ref.invalidate(upCommingMovieFutureProvider);
        ref.invalidate(popularsMovieFutureProvider);
        ref.invalidate(topRatedTVShowFutureProvider);
        ref.invalidate(popularActorsFutureProvider);
      }
    });

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Movies Demo"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade600,
              child: const FlutterLogo(),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming movies".toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      goTo(context, MoviesUI());
                    },
                    child: const Text("more"))
              ],
            ),
          ),
          SizedBox(
            height: size.height * .27,
            width: size.width,
            child: moviesRef.when(data: (data) {
              return CarouselSliderCard(movies: data);
            }, error: (e, st) {
              return const Center(
                child: Text("Oop!"),
              );
            }, loading: () {
              return Center(
                child: Lottie.asset("assets/lottiefiles/searching.json"),
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
                TextButton(onPressed: () {}, child: const SizedBox())
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
                      goTo(context, MovieDetailUI(movieId: data[index].id));
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
                  "TV Show".toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: const SizedBox())
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
                        goTo(
                            context,
                            TVShowDetailUI(
                              tvShowID: data[index].id,
                            ));
                      },
                      child: TVShowCard(tvShow: data[index]));
                },
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
              );
            }, error: (e, _) {
              loggerRef.log(Level.error, "${e.toString()}");
              if(ref.read(netwokStateNotifierProvider) == NetworkStatus.off){
                return Center(
                  child: Lottie.asset("assets/lottiefiles/nointernet.json"),
                );
              }
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
                  "popular Actors & Actress".toUpperCase(),
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: const SizedBox())
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
                        goTo(
                            context,
                            ActorDetailUI(
                              actorID: data[index].id,
                            ));
                      },
                      child: ActorCard(
                        actor: data[index],
                      ));
                },
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
              );
            }, error: (e, _) {
              loggerRef.log(Level.error, "${e.toString()}");
              return const Center(
                child: Text("Oop!"),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ]),
      ),
      drawer: DrawerWidgets(),
    );
  }
}
