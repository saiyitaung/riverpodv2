import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpodv2/routes/routers.dart';

class DrawerWidgets extends StatelessWidget {
  void go(BuildContext context, String r) {
    GoRouter.of(context).go("/$r");
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/tmdb.jpg")),
              ),
            ),
            CustomListTile(
                text: "Movies",
                leading: const Icon(Icons.local_movies),
                callBack: () => go(context, movies)),
            CustomListTile(
              text: "TV show",
              leading: Icon(Icons.movie_outlined),
              callBack: () => go(context, tvshows),
            ),
            CustomListTile(
                leading: Icon(Icons.person_outlined),
                text: "Actors",
                callBack: () => go(context, actors)),
            CustomListTile(
                leading: Icon(Icons.favorite),
                callBack: () => go(context, favorite),
                text: "Favorites"),
            CustomListTile(
                callBack: () => go(context, watch),
                leading: Icon(Icons.movie_outlined),
                text: "Watch List"),
            CustomListTile(
                leading: Icon(Icons.info),
                text: "Abouts",
                callBack: () => go(context, about)),
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
