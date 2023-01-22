import 'package:hive/hive.dart';
import 'package:riverpodv2/models/genre.dart';
import 'package:riverpodv2/models/production_company.dart';
import 'package:riverpodv2/models/production_country.dart';

part 'moviedetail.g.dart';

@HiveType(typeId: 101)
class MovieDetail {
  @HiveField(0)
  bool adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  int budget;
  @HiveField(3)
  List<Genre> genres;
  @HiveField(4)
  String? homePage;
  @HiveField(5)
  int id;
  @HiveField(6)
  String? imdbID;
  @HiveField(7)
  String originalLanguage;
  @HiveField(8)
  String originalTitle;
  @HiveField(9)
  String? overview;
  @HiveField(10)
  double popularity;
  @HiveField(11)
  String? posterPath;
  @HiveField(12)
  List<ProductionCompany> productionCompanies;
  @HiveField(13)
  List<ProductionCountry> productionCountries;
  @HiveField(14)
  String releaseDate;
  @HiveField(15)
  int revenue;
  @HiveField(16)
  double? runtime;
  @HiveField(17)
  String title;
  @HiveField(18)
  bool video;
  @HiveField(19)
  double voteAverage;
  @HiveField(20)
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
