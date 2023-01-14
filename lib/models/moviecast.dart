 

class MovieCast{
  int id;
  String originalLangage;
  String name;
  String? posterPath;
  String title;
  String? backdropPath;
 
 
  MovieCast({
    required this.id,
    required this.name,
    required this.originalLangage,
    this.posterPath,
     required this.title,
    this.backdropPath,
 
 
  });
  MovieCast.fromJson(Map<String,dynamic> json):
  id = json['id'],
  title = json['title'] ?? "",
  name = json['name'] ?? "",
  originalLangage = json['original_language'],
  posterPath = json['poster_path'],
   
  backdropPath = json['backdrop_path']
 
 
  ;
}