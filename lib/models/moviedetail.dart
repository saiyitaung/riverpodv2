import 'package:riverpodv2/models/genre.dart';
import 'package:riverpodv2/models/production_company.dart';
import 'package:riverpodv2/models/production_country.dart';

class MovieDetail {
  bool adult;
  String? backdropPath;
  int budget;
  List<Genre> genres;
  String? homePage;
  int id;
  String? imdbID;
  String originalLanguage;
  String originalTitle;
  String? overview;
  double popularity;
  String? posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  double? runtime;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  MovieDetail(
      {required this.adult,
      this.backdropPath,
      required this.budget,
      required this.genres,
      this.homePage,
      required this.id,
      this.imdbID,
      required this.originalLanguage,
      required this.originalTitle,
      this.overview,
      required this.popularity,
      this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.releaseDate,
      required this.revenue,
      this.runtime,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});
  MovieDetail.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        budget = json['budget'],
        genres = List<dynamic>.from(json['genres'])
            .map((e) => Genre.fromJson(e))
            .toList(),
        homePage = json['home_page'],
        id = json['id'],
        imdbID = json['imdb_id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        productionCompanies = List<dynamic>.from(json['production_companies'])
            .map((e) => ProductionCompany.fromJson(e))
            .toList(),
        productionCountries = List<dynamic>.from(json['production_countries'])
            .map((e) => ProductionCountry.fromJson(e))
            .toList(),
        releaseDate = json['release_date'],
        revenue = json['revenue'],
        runtime = double.parse(json['runtime'].toString()),
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];
}
