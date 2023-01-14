import 'package:flutter/material.dart';
import 'package:riverpodv2/ui/upcomingui.dart';

class DrawerWidgets extends StatelessWidget {
  void goTo(BuildContext context, Widget place) {
    Navigator.push(context, MaterialPageRoute(builder: ((context) => place)));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/img/tmdb.jpg")),
            ),
          ),
          CustomListTile(
            leading: Icon(Icons.movie_outlined),
            text: "Upcoming",
            callBack: () {
              goTo(context, UpcomingUI());
            },
          ),
          CustomListTile(
             leading: Icon(Icons.movie_outlined),
            text: "Popular",
            callBack: () {
              goTo(context, UpcomingUI());
            },
          ),
          CustomListTile(
             leading: Icon(Icons.movie_outlined),
            text: "Top Rated",
            callBack: () {goTo(context, UpcomingUI());},
          ),
          CustomListTile(
             leading: Icon(Icons.movie_outlined),
            text: "TV Show",
            callBack: () {goTo(context, UpcomingUI());},
          ),
          CustomListTile(
            leading: Icon(Icons.person_outlined),
            text: "Actors",
            callBack: () {goTo(context, UpcomingUI());},
          ),
          CustomListTile(
            leading: Icon(Icons.info),
            text: "Abouts",
            callBack: () {goTo(context, UpcomingUI());},
          ),
          Spacer(),
          SizedBox(
            child: Center(child: Text("Flutter Movie Demo 1.0")),
          ),
        ],
      )),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String text;
  final VoidCallback? callBack;
  CustomListTile({required this.text,this.leading, this.callBack, super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(text),
      onTap: callBack,
    );
  }
}
