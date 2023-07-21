import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:flutter_gogonime/Component/form.dart' as kform;
import 'package:flutter_gogonime/Component/search_anime_card.dart';
import 'package:flutter_gogonime/Component/search_shimmer.dart';
import 'package:flutter_gogonime/Notifier/Anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final anime = ref.watch(animeProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Anime'),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: kcolors.bgSlate,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            kform.kTextField(
                initialValue: anime.searchKeyword,
                onChange: (val) {
                  anime.setSearchKeyword(val);
                  anime.getSearchData();
                }),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: size.height * .74,
              child: anime.isSearchLoading
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      primary: false,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, _) {
                        return const SearchLoadingShimmer();
                      },
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      primary: false,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: anime.searchAnime.length,
                      itemBuilder: (context, index) {
                        final currentAnime = anime.searchAnime[index];
                        return SearchAnimeCard(searchAnime: currentAnime);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
