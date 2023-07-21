class SearchAnime {
  String animeId;
  String animeTitle;
  String animeUrl;
  String animeImg;
  String status;

  SearchAnime({required this.animeId, required this.animeTitle, required this.animeUrl, required this.animeImg, required this.status});

  SearchAnime.fromJson(Map<String, dynamic> json)
      : animeId = json['animeId'],
        animeTitle = json['animeTitle'],
        animeUrl = json['animeUrl'],
        animeImg = json['animeImg'],
        status = json['status'];
}
