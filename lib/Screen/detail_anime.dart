import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Component/episode_card.dart';
import 'package:flutter_gogonime/Component/episode_shimmer.dart';
import 'package:flutter_gogonime/Component/synopsis_shimmer.dart';
import 'package:flutter_gogonime/Model/detail_anime.dart';
import 'package:flutter_gogonime/Model/stream_url.dart';
import 'package:flutter_gogonime/Notifier/Anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:flutter_gogonime/Style/text.dart' as ktext;
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class DetailAnimeScreen extends ConsumerStatefulWidget {
  final String id;
  final String imageUrl;
  final String animeTitle;
  const DetailAnimeScreen({super.key, required this.imageUrl, required this.id, required this.animeTitle});

  @override
  DetailAnimeState createState() => DetailAnimeState();
}

class DetailAnimeState extends ConsumerState<DetailAnimeScreen> {
  Anime? detail;
  StreamUrl? streamUrl;

  void initFetch() async {
    AnimeNotifier anime = ref.read(animeProvider);
    final result = await anime.detailAnime(animeId: widget.id);
    setState(() {
      detail = result;
    });
  }

  void handlerStreamUrl(String episodeId) async {
    final anime = ref.read(animeProvider);
    StreamUrl s = await anime.getStreamUrls(episodeId: episodeId);
    setState(() {
      streamUrl = s;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(initFetch);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcolors.bgSlate,
      body: SingleChildScrollView(
        child: Column(
          children: [
            streamUrl == null
                ? Hero(
                    tag: widget.animeTitle,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ))
                : YoYoPlayer(url: streamUrl!.sources[0].file, aspectRatio: 16 / 9),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ktext.kTitleDetail(widget.animeTitle),
                  const SizedBox(
                    height: 10,
                  ),
                  ktext.kRecentTitle("Synopsis", color: Colors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  detail == null ? const SynopsisShimmer() : ktext.kSubtitle(detail!.synopsis),
                  const SizedBox(
                    height: 20,
                  ),
                  ktext.kRecentTitle("Episodes", color: Colors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  detail == null
                      ? const EpisodeShimmer()
                      : Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          height: size.height * .5,
                          width: double.infinity,
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: detail!.episodesList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 40),
                            itemBuilder: (context, index) {
                              final episode = detail!.episodesList[index];
                              return EpisodeCard(
                                episode: episode.episodeNum,
                                onTap: () => handlerStreamUrl(episode.episodeId),
                              );
                            },
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
