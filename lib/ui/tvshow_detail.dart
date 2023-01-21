import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpodv2/components/actor_card.dart';
import 'package:riverpodv2/components/rate_bar.dart';
import 'package:riverpodv2/components/trailer_play_button.dart';
import 'package:riverpodv2/components/trailer_view.dart';
import 'package:riverpodv2/components/tvshow_card.dart';
import 'package:riverpodv2/models/actor.dart';
import 'package:riverpodv2/providers/tvshow_future_provider.dart';
import 'package:riverpodv2/ui/actor_detail.dart';
import 'package:riverpodv2/utils/myutils.dart';

class TVShowDetailUI extends ConsumerWidget {
  final int tvShowID;
  const TVShowDetailUI({required this.tvShowID, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tvRef = ref.watch(tvDetailFutureProvider(tvShowID));
    final castRef = ref.watch(castsByTvShowFutureProvider(tvShowID));
    final similarTvShowsRef = ref.watch(similarTvShowsFutureProvider(tvShowID));
    final trailerKeyRef  = ref.watch(tvTrailerKeyFutureProvider(tvShowID));
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: tvRef.when(data: (data) {
      return SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: size.height * .45,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${bigImageURL}/${data.posterPath}"),
                ),
              ),
              child: Stack(children: [
                Container(
                  height: size.height * .45,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.black12,
                      Colors.black45,
                      Colors.grey.shade900
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_rounded))
                  ]),
                ),
                Positioned(
                  bottom: 50,
                  child: SizedBox(
                    width: size.width,
                    child: Center(
                      child: Text(
                        data.name,
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily:
                                GoogleFonts.getFont("Anton").fontFamily),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: Column(children: [
                      Text(
                        "first air date",
                      ),
                      Text("${data.firstAirDate}")
                    ]),
                  ),
                ),
                TrailerPlayBtn(
                  height: size.height * .45,
                  width: size.width,
                  callBack: () {
                    showDialog(
                        context: context,
                        builder: ((context) {
                          return trailerKeyRef.when(data: (data) {
                            return TrailerView(videoId: data.toString());
                          }, error: (e, _) {
                            return SizedBox();
                          }, loading: () {
                            return SizedBox();
                          });
                        }));
                  },
                ),
              ]),
            ),
            RateBar(
                width: size.width,
                votes: data.voteCount,
                averageVote: data.voteAverage),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    ...data.genreIds.map((e) => Chip(
                          label: Text(e.name),
                        ))
                  ],
                ),
              ),
            ),
            Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Overview",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data.overView,
                        textAlign: TextAlign.justify,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cast".toUpperCase(),
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ),
                  Container(
                    height: 150,
                    child: castRef.when(data: (data) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: ()=> GoRouter.of(context).go("/actors/${data[index].id}") ,
                              child: ActorCard(
                                actor: Actor(
                                    profilePath: data[index].profilePath ?? "",
                                    adult: data[index].adult,
                                    name: data[index].name,
                                    id: data[index].id,
                                    popularity: data[index].popularity),
                              ));
                        },
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                      );
                    }, error: (e, st) {
                      debugPrint(st.toString());
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "similar movies".toUpperCase(),
                            style: const TextStyle(fontSize: 20),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.height * .37,
                    child: similarTvShowsRef.when(data: (data) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: ()=> GoRouter.of(context).go("/tvshows/${data[index].id}") ,
                            child: TVShowCard(tvShow: data[index]),
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
                ],
              ),
            ),
          ],
        )),
      );
    }, error: (e, st) {
      debugPrint(e.toString());
      debugPrint(st.toString());
      return Center(
        child: Text("Oop!"),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
}
