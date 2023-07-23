import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Model/detail_anime.dart';
import 'package:flutter_gogonime/Model/popular_anime.dart';
import 'package:flutter_gogonime/Model/recent_episode.dart';
import 'package:flutter_gogonime/Model/search_anime.dart';
import 'package:flutter_gogonime/Model/stream_url.dart';
import 'package:flutter_gogonime/Repository/gogonime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final animeProvider = ChangeNotifierProvider<AnimeNotifier>((ref) => AnimeNotifier(ref));

class AnimeNotifier extends ChangeNotifier {
  final Ref ref;

  int recentEpisodePage = 1;
  int popularPage = 1;
  bool isLoading = false;
  bool isSearchLoading = false;

  String searchKeyword = "";
  List<RecentEpisode> recentEpisodes = [];
  List<PopularAnime> popularAnime = [];
  List<SearchAnime> searchAnime = [];

  late Box<Anime> _animeBox;
  List<Anime> bookmarks = [];

  AnimeNotifier(this.ref) {
    initBookmarks();
  }

  void initBookmarks() async {
    final b = await Hive.openBox<Anime>('bookmarks');
    _animeBox = b;
    bookmarks = b.values.toList();
  }

  void addBookmarks(String key, Anime anime) async {
    bookmarks.add(anime);
    await _animeBox.put(key, anime);
    notifyListeners();
  }

  void removeBookmarks(String key) async {
    final a = _animeBox.get(key);
    if (a == null) return;
    bookmarks.remove(a);
    notifyListeners();
  }

  bool isSaveInBookmark(Anime a) {
    final exist = bookmarks.indexOf(a);
    return exist != -1;
  }

  void setSearchKeyword(String val) {
    searchKeyword = val;
    notifyListeners();
  }

  Future<void> fetchRecentEpisodes() async {
    isLoading = true;
    notifyListeners();
    final repo = ref.read(gogonimeRepositoryProvider);
    final data = await repo.getRecentEpisode(recentEpisodePage);
    recentEpisodes.addAll(data);
    isLoading = false;
    recentEpisodePage += 1;
    notifyListeners();
  }

  Future<void> fetchPopularAnime() async {
    isLoading = true;
    notifyListeners();
    final repo = ref.read(gogonimeRepositoryProvider);
    final data = await repo.getPopularAnime(popularPage);
    popularAnime.addAll(data);
    isLoading = false;
    popularPage += 1;
    notifyListeners();
  }

  Future<Anime> detailAnime({required String animeId}) async {
    final repo = ref.read(gogonimeRepositoryProvider);
    final data = await repo.detailAnime(animeId: animeId);
    return data;
  }

  Future<void> getSearchData() async {
    isSearchLoading = true;
    notifyListeners();
    final repo = ref.read(gogonimeRepositoryProvider);
    final data = await repo.getSearchAnime(searchKeyword);
    searchAnime = data;
    isSearchLoading = false;
    notifyListeners();
  }

  Future<StreamUrl> getStreamUrls({required String episodeId}) async {
    final repo = ref.read(gogonimeRepositoryProvider);
    return await repo.getStreamUrls(episodeId: episodeId);
  }
}
