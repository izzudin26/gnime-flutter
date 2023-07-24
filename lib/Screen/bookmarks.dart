import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Component/bookmark_card.dart';
import 'package:flutter_gogonime/Notifier/Anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolor;

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});

  @override
  BookmarkScreenState createState() => BookmarkScreenState();
}

class BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final anime = ref.watch(animeProvider);

    return Scaffold(
      backgroundColor: kcolor.bgSlate,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookmarks'),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: anime.bookmarks.length,
        itemBuilder: (context, index) {
          final item = anime.bookmarks[index];
          return BookmarkCard(
            bookmark: item,
          );
        },
      ),
    );
  }
}
