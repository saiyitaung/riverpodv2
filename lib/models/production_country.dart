class ProductionCountry{
  String iso;
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