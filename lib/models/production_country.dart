import 'package:hive/hive.dart';
part 'production_country.g.dart';
@HiveType(typeId: 113)
class ProductionCountry{
  @HiveField(0)
  String iso;
  @HiveField(1)
  String name;
  ProductionCountry({
    required this.iso,
    required this.name,
  });
  ProductionCountry.fromJson(Map<String,dynamic> json):
  iso=json['iso_3166_1'],
  name=json['name']
  ;
}