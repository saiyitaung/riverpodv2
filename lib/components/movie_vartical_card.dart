import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/utils/base.dart';

class MovieVarticalCard extends StatelessWidget {
  final Movie movie;
  final double width;
  const MovieVarticalCard(
      {required this.movie, required this.width, super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        height: size.height * .27,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * .33,
              height: size.height * .27,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2, spreadRadius: 1, offset: Offset(0, 1)),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(2),
                      bottomRight: Radius.circular(2)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: movie.backdropPath == null
                        ? const AssetImage("assets/img/noimage.png")
                        : FadeInImage(
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage("assets/img/noimage.png"),
                            imageErrorBuilder: ((context, error, stackTrace) {
                              return Image.asset(
                                "assets/img/noimage.png",
                                fit: BoxFit.fill,
                              );
                            }),
                            image: NetworkImage(
                              "$bigImageURL/${movie.backdropPath}",
                            ),
                          ).image,
                  )),
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height * .24,
                    width: size.width * .60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900.withOpacity(.6),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${movie.title}",
                            style: TextStyle(
                                fontFamily:
                                    GoogleFonts.getFont("Oswald").fontFamily,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "director : Gerard Johnstone",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Runtime : 1h 20min",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  "${movie.voteAverage.toStringAsFixed(1)}",
                                  style: TextStyle(fontSize: 29),
                                ),
                                RatingBarIndicator(
                                  itemBuilder: ((context, index) {
                                    return Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    );
                                  }),
                                  itemCount: 5,
                                  rating: movie.voteAverage / 2,
                                  itemSize: 23,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
