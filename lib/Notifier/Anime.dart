import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Model/popular_anime.dart';
import 'package:flutter_gogonime/Model/recent_episode.dart';
import 'package:flutter_gogonime/Repository/gogonime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeProvider = ChangeNotifierProvider<AnimeNotifier>((ref) => AnimeNotifier(ref));

class AnimeNotifier extends ChangeNotifier {
  final Ref ref;
  AnimeNotifier(this.ref);

  int recentEpisodePage = 1;
  bool isLoading = false;
  List<RecentEpisode> recentEpisodes = [];
  List<PopularAnime> popularAnime = [];

  Future<void> fetchRecentEpisodes() async {
    isLoading = true;
    notifyListeners();
    final repo = ref.read(gogonimeRepositoryProvider);
    final data = await repo.getRecentEpisode(recentEpisodePage);
    recentEpisodes.addAll(data);
    isLoading = false;
    ++recentEpisodePage;
    notifyListeners();
  }

  Future<void> fetchPopularAnime() async {
    isLoading = true;
    notifyListeners();
    final repo = ref.read(gogonimeRepositoryProvider);
    popularAnime = await repo.getPopularAnime();
    isLoading = false;
    notifyListeners();
  }
}
