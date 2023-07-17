import 'dart:convert';
import 'package:flutter_gogonime/Model/detail_anime.dart';
import 'package:flutter_gogonime/Model/popular_anime.dart';
import 'package:flutter_gogonime/Model/recent_episode.dart';
import 'package:flutter_gogonime/Model/stream_url.dart';
import 'package:flutter_gogonime/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gogonime/http.dart';

final gogonimeRepositoryProvider = Provider((ref) => GogonimeRepository(ref));

class GogonimeRepository {
  final Ref ref;
  GogonimeRepository(this.ref);

  Future<List<RecentEpisode>> getRecentEpisode(int page) async {
    final client = ref.read(httpProviderService);
    final url = Uri.parse("$BASE_URL/recent-release?page=$page");
    final res = await client.get(url);
    final resBody = jsonDecode(res.body);
    return (resBody as List).map((e) => RecentEpisode.fromJson(e)).toList();
  }

  Future<List<PopularAnime>> getPopularAnime() async {
    final client = ref.read(httpProviderService);
    final url = Uri.parse("$BASE_URL/popular");
    final res = await client.get(url);
    final resBody = jsonDecode(res.body);
    return (resBody as List).map((e) => PopularAnime.fromJson(e)).toList();
  }

  Future<Anime> detailAnime({required String animeId}) async {
    final client = ref.read(httpProviderService);
    final url = Uri.parse("$BASE_URL/anime-details/$animeId");
    final res = await client.get(url);
    final resBody = jsonDecode(res.body);
    return Anime.fromJson(resBody);
  }

  Future<StreamUrl> getStreamUrls({required String episodeId}) async {
    final client = ref.read(httpProviderService);
    final url = Uri.parse("$BASE_URL/vidcdn/watch/$episodeId");
    final res = await client.get(url);
    final resBody = jsonDecode(res.body);
    return StreamUrl.fromJson(resBody);
  }
}
