import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Model/detail_anime.dart';
import 'package:flutter_gogonime/Screen/detail_anime.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:flutter_gogonime/Style/text.dart' as ktext;

class BookmarkCard extends StatelessWidget {
  final Anime bookmark;
  const BookmarkCard({super.key, required this.bookmark});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailAnimeScreen(imageUrl: bookmark.animeImg, id: bookmark.id!, animeTitle: bookmark.animeTitle)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                bookmark.animeImg,
                height: 180,
                width: 130,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.shade300,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcolors.bgSlate),
                      width: 130,
                      height: 180,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ktext.kTitleDetail(bookmark.animeTitle),
                const SizedBox(
                  height: 15,
                ),
                ktext.kSubtitle(bookmark.status)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
