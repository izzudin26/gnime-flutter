class EpisodesList {
  String episodeId;
  String episodeNum;
  String episodeUrl;
  EpisodesList.fromJson(Map<String, dynamic> json)
      : episodeId = json['episodeId'],
        episodeNum = json['episodeNum'],
        episodeUrl = json['episodeUrl'];
}

class Anime {
  String animeTitle;
  String type;
  String releasedDate;
  String status;
  List<String> genres;
  String otherNames;
  String synopsis;
  String animeImg;
  String totalEpisode;
  List<EpisodesList> episodesList;
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
