class ActorDetail {
  int id;
  String name;
  List<String> alsoKnownAs;
  int gender;
  String biography;
  double popularity;
  String? placeOfBirth;
  String? profilePath;
  bool adult;
  String imdbID;
  String? homepage;
  String? birthday;
  ActorDetail({
    required this.id,
    required this.name,
    required this.alsoKnownAs,
    required this.gender,
    required this.biography,
    required this.popularity,
    this.placeOfBirth,
    this.profilePath,
    required this.adult,
    required this.imdbID,
    this.homepage,
    this.birthday,
  });
  ActorDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        alsoKnownAs = json['also_known_as'].cast<String>(),
        gender = json['gender'],
        biography = json['biography'],
        popularity = double.parse(json['popularity'].toString()),
        placeOfBirth = json['place_of_birth'],
        profilePath = json['profile_path'],
        adult = json['adult'],
        imdbID = json['imdb_id'],
        homepage = json['homepage'],
        birthday = json['birthday'];
}
