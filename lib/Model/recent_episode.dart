class RecentEpisode {
  String episodeId;
  String animeTitle;
  String episodeNum;
  String subOrDub;
  String animeImg;
  String episodeUrl;
  RecentEpisode.fromJson(Map<String, dynamic> json)
      : episodeId = json['episodeId'],
        animeTitle = json['animeTitle'],
        episodeNum = json['episodeNum'],
        subOrDub = json['subOrDub'],
        animeImg = json['animeImg'],
        episodeUrl = json['episodeUrl'];
}
