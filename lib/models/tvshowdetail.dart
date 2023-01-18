import 'package:riverpodv2/models/genre.dart';

class TVShowDetail {
  String? posterPath;
  double popularity;
  int id;
  String? backdropPath;
  double voteAverage;
  String overView;
  String firstAirDate;
  String lastAirDate;
  List<String> originCountry;
  List<Genre> genreIds;
  String originalLanguage;
  int voteCount;
  String name;
  String originalName;
  TVShowDetail(
      {this.posterPath,
      required this.popularity,
      required this.id,
      this.backdropPath,
      required this.lastAirDate,
      required this.voteAverage,
      required this.overView,
      required this.firstAirDate,
      required this.originCountry,
      required this.genreIds,
      required this.originalLanguage,
      required this.voteCount,
      required this.name,
      required this.originalName});
  TVShowDetail.fromJson(Map<String, dynamic> json)
      : posterPath = json['poster_path'],
        popularity = json['popularity'],
        id = json['id'],
        backdropPath = json['backdrop_path'],
        voteAverage = double.parse(json['vote_average'].toString()),
        overView = json['overview'],
        firstAirDate = json['first_air_date'],
        originCountry = json['origin_country'].cast<String>(),
        genreIds = List<dynamic>.from(json['genres'])
            .map((e) => Genre.fromJson(e))
            .toList(),
        originalLanguage = json['original_language'],
        voteCount = json['vote_count'],
        name = json['name'],
        originalName = json['original_name'],
        lastAirDate = json['last_air_date'];
}
