import 'package:flutter/material.dart';
 
import 'package:riverpodv2/ui/about_ui.dart';
import 'package:riverpodv2/ui/actors_ui.dart';
import 'package:riverpodv2/ui/favorite_ui.dart';
import 'package:riverpodv2/ui/movie_ui.dart';
import 'package:riverpodv2/ui/tvshow_ui.dart';
import 'package:riverpodv2/ui/watch_list_ui.dart';

class DrawerWidgets extends StatelessWidget {
  void goTo(BuildContext context, Widget place) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => place)));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: SingleChildScrollView(
            child: Column(
                  children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/img/tmdb.jpg")),
              ),
            ),
            CustomListTile(text: "Movies",leading: Icon(Icons.local_movies),
            callBack: (){
               goTo(context, MoviesUI());
            }),
            CustomListTile(text: "TV show",leading: Icon(Icons.movie_outlined),
            callBack: (){
               goTo(context, TVShowUI());
            },),
            CustomListTile(
              leading: Icon(Icons.person_outlined),
              text: "Actors",
              callBack: () {
                goTo(context, ActorsUI());
              },
            ),
               
            CustomListTile(
              leading: Icon(Icons.favorite),
              callBack: (){
                 goTo(context, MyFavoriteUI());
              },
              text: "Favorites"),
            CustomListTile(
              callBack: (){
                goTo(context, WatchListUI());
              },
              leading: Icon(Icons.movie_outlined)
              ,text: "Watch List"),
            CustomListTile(
              leading: Icon(Icons.info),
              text: "Abouts",
              callBack: () {
                goTo(context, AboutUI());
              },
            ),         
                  ],
                ),
          )),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String text;
  final VoidCallback? callBack;
  CustomListTile({required this.text, this.leading, this.callBack, super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(text),
      onTap: callBack,
    );
  }
}
