import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Model/recent_episode.dart';
import 'package:flutter_gogonime/Style/text.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:shimmer/shimmer.dart';

class RecentAnimeCard extends StatelessWidget {
  final RecentEpisode recentEpisode;
  const RecentAnimeCard({super.key, required this.recentEpisode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                recentEpisode.animeImg,
                fit: BoxFit.cover,
                height: 200,
                width: 160,
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
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcolors.slate600),
                child: kFloatingEpisode("Episode ${recentEpisode.episodeNum}"),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(padding: const EdgeInsets.symmetric(horizontal: 13), child: kRecentTitle(recentEpisode.animeTitle))
      ],
    );
  }
}
