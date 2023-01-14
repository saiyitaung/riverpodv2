class ProductionCompany{
  String name;
  int id;
  String? logoPath;
  String originCountry;
  ProductionCompany({
    required this.name,
    required this.id,
     this.logoPath,
    required this.originCountry
  });
  ProductionCompany.fromJson(Map<String,dynamic> json):
  name = json['name'],
  id = json['id'],
  logoPath = json['logo_path'],
  originCountry=json['origin_country']
  ;
}