import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpodv2/models/genre.dart';
import 'package:riverpodv2/models/moviedetail.dart';
import 'package:riverpodv2/models/production_company.dart';
import 'package:riverpodv2/models/production_country.dart';
import 'package:riverpodv2/models/tvshowdetail.dart';
 
import 'package:riverpodv2/routes/routers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  
 
  //final dir = await getExternalStorageDirectory();
  final dir = Directory("datafiles");
   await Hive.initFlutter(dir.path);
   Hive.registerAdapter(MovieDetailAdapter());
   Hive.registerAdapter(TVShowDetailAdapter());
   Hive.registerAdapter(GenreAdapter());
   Hive.registerAdapter(ProductionCountryAdapter());
   Hive.registerAdapter(ProductionCompanyAdapter());
   await Hive.openBox<MovieDetail>("favoritemovies");
   await Hive.openBox<MovieDetail>("moviewatchlist");
   await Hive.openBox<TVShowDetail>("favoriteTVShows");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
    );
  }
}
