import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:riverpodv2/components/carousel_box.dart';
import 'package:riverpodv2/models/movie.dart';
import 'package:riverpodv2/ui/movie_detail.dart';

class CarouselSliderCard extends StatelessWidget {
  final List<Movie> movies;
  CarouselSliderCard({required this.movies, super.key});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: movies
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
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: null,
          scrollDirection: Axis.vertical,
        ));
  }
}
