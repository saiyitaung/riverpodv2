import 'package:flutter/material.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/utils/base.dart';

class CarouselBox extends StatelessWidget {
  final Movie movie;
  const CarouselBox({required this.movie, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
           
          image: DecorationImage(
              fit: BoxFit.cover,
              image: movie.backdropPath == null
                  ? Image.asset("assets/img/noimage.png").image
                  : FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: const AssetImage("assets/img/noimage.png"),
                      imageErrorBuilder: ((context, error, stackTrace) {
                        return Image.asset(
                          "assets/img/noimage.png",
                          fit: BoxFit.cover,
                        );
                      }),
                      image: NetworkImage(
                        "$bigImageURL/${movie.backdropPath}",
                      ),
                    ).image)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.only(left: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(9),
                          bottomRight: Radius.circular(9)),
                gradient: LinearGradient(
                    colors: [Colors.black26, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${movie.originalTitle}",
                      style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w400),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                        width: size.width * .3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text("${movie.voteAverage}"),
                              ],
                            ),
                            Text("${movie.releaseDate}")
                          ],
                        )),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
