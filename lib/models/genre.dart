import 'package:hive/hive.dart';
part 'genre.g.dart';
@HiveType(typeId: 111)
class Genre {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  Genre({
    required this.id,
    required this.name,
  });
  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
  @override
  String toString(){
    return "id : $id , name : $name";
  }
}
