// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_anime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodesListAdapter extends TypeAdapter<EpisodesList> {
  @override
  final int typeId = 1;

  @override
  EpisodesList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodesList(
      episodeId: fields[0] as String,
      episodeNum: fields[1] as String,
      episodeUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodesList obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.episodeId)
      ..writeByte(1)
      ..write(obj.episodeNum)
      ..writeByte(2)
      ..write(obj.episodeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodesListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimeAdapter extends TypeAdapter<Anime> {
  @override
  final int typeId = 0;

  @override
  Anime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Anime(
      animeImg: fields[7] as String,
      animeTitle: fields[0] as String,
      episodesList: (fields[9] as List).cast<EpisodesList>(),
      genres: (fields[4] as List).cast<String>(),
      otherNames: fields[5] as String,
      releasedDate: fields[2] as String,
      status: fields[3] as String,
      synopsis: fields[6] as String,
      totalEpisode: fields[8] as String,
      type: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Anime obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.animeTitle)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.releasedDate)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.otherNames)
      ..writeByte(6)
      ..write(obj.synopsis)
      ..writeByte(7)
      ..write(obj.animeImg)
      ..writeByte(8)
      ..write(obj.totalEpisode)
      ..writeByte(9)
      ..write(obj.episodesList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
