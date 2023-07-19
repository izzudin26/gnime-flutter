import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Component/episode_shimmer.dart';
import 'package:flutter_gogonime/Component/synopsis_shimmer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:flutter_gogonime/Style/text.dart' as ktext;

class DetailAnime extends ConsumerStatefulWidget {
  final String id;
  final String imageUrl;
  final String animeTitle;
  const DetailAnime({super.key, required this.imageUrl, required this.id, required this.animeTitle});

  @override
  DetailAnimeState createState() => DetailAnimeState();
}

class DetailAnimeState extends ConsumerState<DetailAnime> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcolors.bgSlate,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: widget.animeTitle,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.width,
                )),
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
                  const SynopsisShimmer(),
                  const SizedBox(
                    height: 20,
                  ),
                  ktext.kRecentTitle("Episodes", color: Colors.white),
                  const SizedBox(
                    height: 5,
                  ),
                  const EpisodeShimmer()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
