class PopularAnime {
  String animeId;
  String animeTitle;
  String animeImg;
  String? releasedDate;
  String? status;
  String animeUrl;

  PopularAnime.fromJson(Map<String, dynamic> json)
      : animeId = json['animeId'],
        animeTitle = json['animeTitle'],
        animeImg = json['animeImg'],
        releasedDate = json['releasedDate'],
        status = json['status'],
        animeUrl = json['animeUrl'];
}
