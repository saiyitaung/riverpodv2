
import 'package:riverpodv2/models/tvshow.dart';

class Movie {
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  String? posterPath;
  //will change DateTime later
  String? releaseDate;
  String title;
  bool video;
  double voteAverage;
  int votecount;

  Movie({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.votecount,
  });
  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = double.parse(json['popularity'].toString()),
        adult = json['adult'],
        backdropPath = json['backdrop_path'],
        genreIds = List<int>.from(json['genre_ids']),
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = double.parse(json['vote_average'].toString()),
        votecount = json['vote_count'];
  Movie.fromTvShow(TVShow tv):
  id = tv.id,
        originalLanguage = tv.originalLanguage,
        originalTitle = tv.name,
        overview = tv.overView,
        popularity = tv.popularity,
        adult = false,
        backdropPath = tv.backdropPath,
        genreIds = tv.genreIds,
        posterPath = tv.posterPath,
        releaseDate = tv.firstAirDate,
        title = tv.originalName,
        video = false,
        voteAverage = tv.voteAverage,
        votecount = tv.voteCount
  ;
}
