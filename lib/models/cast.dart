class Cast{
  bool adult;
  int? gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;
 
  String character;
  String creditID;
  int order;
  Cast({
    required this.adult,
    this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
 
    required this.character,
    required this.creditID,
    required this.order,
  });
  Cast.fromJson(Map<String,dynamic> json):
  adult = json['adult'],
  gender = json['gender'],
  id = json['id'],
  knownForDepartment = json['known_for_department'],
  name = json['name'],
  originalName = json['original_name'],
  popularity =  double.parse(json['popularity'].toString()),
  profilePath = json['profile_path'],
   
  character = json['character'],
  creditID = json['credit_id'],
  order = json['order']
  ;
}