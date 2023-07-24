import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Component/bottom_navigation.dart';
import 'package:flutter_gogonime/Screen/bookmarks.dart';
import 'package:flutter_gogonime/Screen/popular.dart';
import 'package:flutter_gogonime/Screen/recent.dart';
import 'package:flutter_gogonime/Screen/search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolor;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int currentPage = 0;

  List<Widget> screen = const [RecentAnimeScreen(), PopularAnimeScreen(), SearchScreen(), BookmarkScreen()];
  List<IconData> navigationIcon = const [LucideIcons.layoutGrid, LucideIcons.monitorUp, LucideIcons.search, LucideIcons.bookmark];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          screen[currentPage],
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: BottomNavigation(
                children: navigationIcon.asMap().entries.map((e) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentPage = e.key;
                      });
                    },
                    child: Icon(
                      navigationIcon[e.key],
                      size: 26,
                      color: currentPage == e.key ? kcolor.primary : Colors.grey.shade300,
                    ),
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}
