import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Model/popular_anime.dart';
import 'package:flutter_gogonime/Model/recent_episode.dart';
import 'package:flutter_gogonime/Style/text.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:shimmer/shimmer.dart';

class RecentAnimeCard extends StatelessWidget {
  final RecentEpisode? recentEpisode;
  final PopularAnime? popularAnime;
  const RecentAnimeCard({super.key, this.recentEpisode, this.popularAnime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                recentEpisode?.animeImg ?? popularAnime!.animeImg,
                fit: BoxFit.cover,
                width: 180,
                height: 230,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Shimmer.fromColors(
                    baseColor: kcolors.bgSlate,
                    highlightColor: kcolors.slate600,
                    child: Container(
                      decoration: BoxDecoration(color: kcolors.slate600, borderRadius: BorderRadius.circular(10)),
                      width: 160,
                      height: 200,
                    ),
                  );
                },
              ),
            ),
            recentEpisode != null
                ? Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcolors.slate600),
                      child: kFloatingEpisode("Episode ${recentEpisode?.episodeNum}"),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, kcolors.bgSlate])),
                  child: kRecentTitle(recentEpisode?.animeTitle ?? popularAnime!.animeTitle)),
            )
          ],
        ),
      ],
    );
  }
}
