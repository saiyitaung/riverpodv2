import 'package:hive/hive.dart';
import 'package:riverpodv2/models/genre.dart';

part 'tvshowdetail.g.dart';

@HiveType(typeId: 102)
class TVShowDetail {
  @HiveField(0)
  String? posterPath;
  @HiveField(1)
  double popularity;
  @HiveField(2)
  int id;
  @HiveField(3)
  String? backdropPath;
  @HiveField(4)
  double voteAverage;
  @HiveField(5)
  String overView;
  @HiveField(6)
  String firstAirDate;
  @HiveField(7)
  String lastAirDate;
  @HiveField(8)
  List<String> originCountry;
  @HiveField(9)
  List<Genre> genreIds;
  @HiveField(10)
  String originalLanguage;
  @HiveField(11)
  int voteCount;
  @HiveField(12)
  String name;
  @HiveField(13)
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
