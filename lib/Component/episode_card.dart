import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolor;
import 'package:flutter_gogonime/Style/text.dart' as ktext;

class EpisodeCard extends StatelessWidget {
  final String episode;
  final void Function()? onTap;
  const EpisodeCard({super.key, required this.episode, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(5),
          border: Border.all(color: kcolor.slate600),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Center(child: ktext.kRecentTitle("E$episode", color: Colors.white)),
      ),
    );
  }
}
