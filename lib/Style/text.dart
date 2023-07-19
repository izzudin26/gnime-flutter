import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;

Text kRecentTitle(String title) {
  return Text(
    title,
    style: const TextStyle(color: kcolors.primary, fontSize: 14, fontWeight: FontWeight.w600),
    softWrap: false,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Text kSubtitle(String subtitle) {
  return Text(
    subtitle,
    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
  );
}

Text kFloatingEpisode(String text) {
  return Text(
    text,
    style: const TextStyle(color: kcolors.primary, fontSize: 12, fontWeight: FontWeight.w600),
  );
}
