import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpodv2/components/movie_card.dart';
import 'package:riverpodv2/models/actor.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/providers/actors_future_provider.dart';
import 'package:riverpodv2/ui/movie_detail.dart';
import 'package:riverpodv2/utils/base.dart';

class ActorDetailUI extends ConsumerWidget {
  final int actorID;
  const ActorDetailUI({required this.actorID, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieCastsRef = ref.watch(moviesCastByActorFutureProvider(actorID));
    final actorDetailRef = ref.watch(actorDetailFutureProvider(actorID));
    final size = MediaQuery.of(context).size;
   // debugPrint(actor.id.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: actorDetailRef.when(data: (actorDetail) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * .65,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FadeInImage(
                          placeholder: AssetImage("assets/img/noimage.png"),
                          imageErrorBuilder: ((context, error, stackTrace) {
                            return Image(
                                image: AssetImage("assets/img/noimage.png"));
                          }),
                          image: NetworkImage(
                              "${bigImageURL}/${actorDetail.profilePath}"),
                        ).image)),
                child: Stack(children: [
                  Container(
                    height: size.height * .65,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black12, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                  Positioned(
                      child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
                  Positioned(
                    bottom: 60,
                    child: SizedBox(
                      width: size.width,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              actorDetail.name.split(" ")[0],
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.getFont("Monoton").fontFamily,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              actorDetail.name.split(" ")[1],
                              style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.getFont("Monoton").fontFamily,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900.withOpacity(.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "${actorDetail.popularity.toStringAsFixed(1)}"),
                            ],
                          )),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(child: Text("birth place")),
                              SizedBox(
                                height: 2,
                              ),
                              Flexible(
                                  child: Text(
                                "${actorDetail.placeOfBirth}",
                                textAlign: TextAlign.center,
                              )),
                            ],
                          )),
                          Flexible(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("birthday"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("${actorDetail.birthday}")
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                    textAlign: TextAlign.justify, "${actorDetail.biography}"),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Known for",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.getFont("Mitr").fontFamily,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: size.height * .37,
                child: movieCastsRef.when(data: (data) {
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
                        child: MovieCard(
                            movie: Movie(
                                id: data[index].id,
                                originalLanguage: "originalLanguage",
                                originalTitle: data[index].title,
                                overview: "overview",
                                popularity: 5.0,
                                adult: false,
                                genreIds: [0],
                                title: data[index].title,
                                video: false,
                                voteAverage: 5.6,
                                votecount: 0,
                                backdropPath: data[index].backdropPath)),
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
          );
        }, error: (e, st) {
          debugPrint(st.toString());
          debugPrint(e.toString());
          return Center(
            child: Text("Oop!"),
          );
        }, loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        })),
      ),
    );
  }
}
