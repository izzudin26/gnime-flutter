import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Component/loadingRecent.dart';
import 'package:flutter_gogonime/Component/recent_anime_card.dart';
import 'package:flutter_gogonime/Notifier/Anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gogonime/Colors.dart' as colors;

class RecentAnimeScreen extends ConsumerStatefulWidget {
  const RecentAnimeScreen({super.key});

  @override
  RecentAnimeScreenState createState() => RecentAnimeScreenState();
}

class RecentAnimeScreenState extends ConsumerState<RecentAnimeScreen> {
  late ScrollController _scrollController;

  void initFetch() async {
    final anime = ref.read(animeProvider);
    await anime.fetchRecentEpisodes();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    Future.microtask(initFetch);
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 50) {
      initFetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    final anime = ref.watch(animeProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recent Release'),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: colors.bgSlate,
      body: ListView(
        controller: _scrollController,
        children: [
          anime.recentEpisodes.isNotEmpty
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20, mainAxisExtent: 230),
                  padding: const EdgeInsets.all(20),
                  itemCount: anime.recentEpisodes.length,
                  itemBuilder: (context, index) {
                    final recentEpisode = anime.recentEpisodes[index];
                    return RecentAnimeCard(recentEpisode: recentEpisode);
                  },
                )
              : const SizedBox(),
          anime.isLoading ? const LoadingRecent() : const SizedBox()
        ],
      ),
    );
  }
}
