import 'package:flutter/material.dart';

class RateBar extends StatelessWidget {
  final double height;
  final double width;
  final int votes;
  final double averageVote;

  const RateBar(
      {this.height = 80,
      required this.width,
      required this.votes,
      required this.averageVote,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        boxShadow: const [
          BoxShadow(blurRadius: 1, spreadRadius: 1, offset: Offset(0, 1))
        ],
      ),
      height: height,
      width: width,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(votes.toString()),
                const SizedBox(
                  height: 3,
                ),
                const Text("Votes")
              ],
            )),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(averageVote.toStringAsFixed(1)),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.favorite,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("Rate")
                ],
              ),
            ),
          ]),
    );
  }
}
