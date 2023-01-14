import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodv2/components/movie_card.dart';
import 'package:riverpodv2/providers/movie_future_provider.dart';
import 'package:riverpodv2/ui/movie_detail.dart';

class UpcomingUI extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upCommingRef = ref.watch(upCommingMovieFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcomming "),
      ),
      body: upCommingRef.when(data: (data) {
        return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio:.8,
               
              ),
          itemBuilder: ((context, index) {
            return InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => MovieDetailUI(movieId: data[index].id))));
            },child: MovieCard(movie: data[index],width: 185,));
          }),
          itemCount: data.length,
        );
      }, error: (e, _) {
        return Text("Oop! something wrong!");
      }, loading: () {
        return CircularProgressIndicator();
      }),
    );
  }
}
