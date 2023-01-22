import 'package:flutter/material.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/utils/myutils.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final double width;
  const MovieCard({required this.movie, this.width = 160, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * .29,
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: movie.backdropPath == null
                    ? const AssetImage("assets/img/noimage.png")
                    : FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: const AssetImage("assets/img/noimage.png"),
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
        Container(
          height: (size.height * .37) - (size.height * .29),
          width: width,
          decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    Text("${movie.voteAverage.toStringAsFixed(1)}")
                  ],
                ),
                Text(
                  movie.title.contains(":")
                      ? movie.title.split(":")[1]
                      : movie.title,
                  style: const TextStyle(fontSize: 11),
                )
              ]),
        )
      ],
    );
  }
}
