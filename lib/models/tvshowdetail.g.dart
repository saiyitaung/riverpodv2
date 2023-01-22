// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvshowdetail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TVShowDetailAdapter extends TypeAdapter<TVShowDetail> {
  @override
  final int typeId = 102;

  @override
  TVShowDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TVShowDetail(
      posterPath: fields[0] as String?,
      popularity: fields[1] as double,
      id: fields[2] as int,
      backdropPath: fields[3] as String?,
      lastAirDate: fields[7] as String,
      voteAverage: fields[4] as double,
      overView: fields[5] as String,
      firstAirDate: fields[6] as String,
      originCountry: (fields[8] as List).cast<String>(),
      genreIds: (fields[9] as List).cast<Genre>(),
      originalLanguage: fields[10] as String,
      voteCount: fields[11] as int,
      name: fields[12] as String,
      originalName: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TVShowDetail obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.posterPath)
      ..writeByte(1)
      ..write(obj.popularity)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.voteAverage)
      ..writeByte(5)
      ..write(obj.overView)
      ..writeByte(6)
      ..write(obj.firstAirDate)
      ..writeByte(7)
      ..write(obj.lastAirDate)
      ..writeByte(8)
      ..write(obj.originCountry)
      ..writeByte(9)
      ..write(obj.genreIds)
      ..writeByte(10)
      ..write(obj.originalLanguage)
      ..writeByte(11)
      ..write(obj.voteCount)
      ..writeByte(12)
      ..write(obj.name)
      ..writeByte(13)
      ..write(obj.originalName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TVShowDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
