
import 'package:flutter/material.dart';
import 'package:riverpodv2/models/tvshow.dart';
import 'package:riverpodv2/utils/myutils.dart';

class TVShowCard extends StatelessWidget{
  final TVShow tvShow;

  const TVShowCard({required this.tvShow,super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint(tvShow.name);
    return Column(
      children: [
        Container(
          height: size.height * .29,
          width: 160,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: tvShow.backdropPath == null
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
                          "$bigImageURL/${tvShow.backdropPath}",
                        ),
                      ).image,
              )),
        ),
        Container(
          height: (size.height * .37) - (size.height * .29),
          width: 160,
          
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
                    Text("${tvShow.voteAverage}")
                  ],
                ),
                Flexible(
                  child: Text(
                    tvShow.name.contains(":") ? tvShow.name.split(":")[1] : tvShow.name,
                    style: const TextStyle(fontSize: 11),
                  ),
                )
              ]),
        )
      ],
    );
  }

}