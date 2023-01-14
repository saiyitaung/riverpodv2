class Actor {
  String profilePath;
  bool adult;
  int id;
  String name;
  double popularity;
  Actor(
      {required this.profilePath,
      required this.adult,
      required this.name,
      required this.id,
      required this.popularity});
  Actor.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        popularity = double.parse(json['popularity'].toString()),
        adult = json['adult'],
        profilePath = json['profile_path'];
}
