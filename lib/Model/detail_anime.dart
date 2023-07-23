import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'detail_anime.g.dart';

@HiveType(typeId: 1)
class EpisodesList {
  @HiveField(0)
  String episodeId;

  @HiveField(1)
  String episodeNum;

  @HiveField(2)
  String episodeUrl;

  EpisodesList({required this.episodeId, required this.episodeNum, required this.episodeUrl});

  EpisodesList.fromJson(Map<String, dynamic> json)
      : episodeId = json['episodeId'],
        episodeNum = json['episodeNum'],
        episodeUrl = json['episodeUrl'];
}

@HiveType(typeId: 0)
class Anime {
  @HiveField(0)
  String animeTitle;

  @HiveField(1)
  String type;

  @HiveField(2)
  String releasedDate;

  @HiveField(3)
  String status;

  @HiveField(4)
  List<String> genres;

  @HiveField(5)
  String otherNames;

  @HiveField(6)
  String synopsis;

  @HiveField(7)
  String animeImg;

  @HiveField(8)
  String totalEpisode;

  @HiveField(9)
  List<EpisodesList> episodesList;

  Anime(
      {required this.animeImg,
      required this.animeTitle,
      required this.episodesList,
      required this.genres,
      required this.otherNames,
      required this.releasedDate,
      required this.status,
      required this.synopsis,
      required this.totalEpisode,
      required this.type});

  Anime.fromJson(Map<String, dynamic> json)
      : animeTitle = json['animeTitle'],
        type = json['type'],
        releasedDate = json['releasedDate'],
        status = json['status'],
        genres = (json['genres'] as List<dynamic>).cast<String>(),
        otherNames = json['otherNames'],
        synopsis = json['synopsis'],
        animeImg = json['animeImg'],
        totalEpisode = json['totalEpisodes'],
        episodesList = (json['episodesList'] as List).map((e) => EpisodesList.fromJson(e)).toList();
}
