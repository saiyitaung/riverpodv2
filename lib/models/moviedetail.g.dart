// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moviedetail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailAdapter extends TypeAdapter<MovieDetail> {
  @override
  final int typeId = 101;

  @override
  MovieDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetail(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String?,
      budget: fields[2] as int,
      genres: (fields[3] as List).cast<Genre>(),
      homePage: fields[4] as String?,
      id: fields[5] as int,
      imdbID: fields[6] as String?,
      originalLanguage: fields[7] as String,
      originalTitle: fields[8] as String,
      overview: fields[9] as String?,
      popularity: fields[10] as double,
      posterPath: fields[11] as String?,
      productionCompanies: (fields[12] as List).cast<ProductionCompany>(),
      productionCountries: (fields[13] as List).cast<ProductionCountry>(),
      releaseDate: fields[14] as String,
      revenue: fields[15] as int,
      runtime: fields[16] as double?,
      title: fields[17] as String,
      video: fields[18] as bool,
      voteAverage: fields[19] as double,
      voteCount: fields[20] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetail obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.genres)
      ..writeByte(4)
      ..write(obj.homePage)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.imdbID)
      ..writeByte(7)
      ..write(obj.originalLanguage)
      ..writeByte(8)
      ..write(obj.originalTitle)
      ..writeByte(9)
      ..write(obj.overview)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.posterPath)
      ..writeByte(12)
      ..write(obj.productionCompanies)
      ..writeByte(13)
      ..write(obj.productionCountries)
      ..writeByte(14)
      ..write(obj.releaseDate)
      ..writeByte(15)
      ..write(obj.revenue)
      ..writeByte(16)
      ..write(obj.runtime)
      ..writeByte(17)
      ..write(obj.title)
      ..writeByte(18)
      ..write(obj.video)
      ..writeByte(19)
      ..write(obj.voteAverage)
      ..writeByte(20)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
