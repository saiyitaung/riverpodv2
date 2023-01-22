import 'package:hive/hive.dart';

part 'production_company.g.dart';
@HiveType(typeId: 112)
class ProductionCompany {
  @HiveField(0)
  String name;
  @HiveField(1)
  int id;
  @HiveField(2)
  String? logoPath;
  @HiveField(3)
  String originCountry;
  ProductionCompany(
      {required this.name,
      required this.id,
      this.logoPath,
      required this.originCountry});
  ProductionCompany.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        logoPath = json['logo_path'],
        originCountry = json['origin_country'];
}
