class TVShow {
  String? posterPath;
  double popularity;
  int id;
  String? backdropPath;
  double voteAverage;
  String overView;
  String firstAirDate;
  List<String> originCountry;
  List<int> genreIds;
  String originalLanguage;
  int voteCount;
  String name;
  String originalName;
  TVShow(
      {this.posterPath,
      required this.popularity,
      required this.id,
      this.backdropPath,
      required this.voteAverage,
      required this.overView,
      required this.firstAirDate,
      required this.originCountry,
      required this.genreIds,
      required this.originalLanguage,
      required this.voteCount,
      required this.name,
      required this.originalName});
  TVShow.fromJson(Map<String,dynamic> json):
  posterPath = json['poster_path'],
  popularity = json['popularity'],
  id = json['id'],
  backdropPath = json['backdrop_path'],
  voteAverage = double.parse(json['vote_average'].toString()),
  overView = json['overview'],
  firstAirDate = json['first_air_date'],
  originCountry = json['origin_country'].cast<String>(),
  genreIds = json['genre_ids'].cast<int>(),
  originalLanguage = json['original_language'],
  voteCount = json['vote_count'],
  name = json['name'],
  originalName = json['original_name']
  ;
}
