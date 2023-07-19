import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;

Text kRecentTitle(String title, {Color? color}) {
  return Text(
    title,
    style: TextStyle(color: color ?? kcolors.primary, fontSize: 14, fontWeight: FontWeight.w600),
    softWrap: false,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );
}

Text kSubtitle(String subtitle, {Color? color}) {
  return Text(
    subtitle,
    style: TextStyle(color: color ?? Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
  );
}

Text kFloatingEpisode(String text) {
  return Text(
    text,
    style: const TextStyle(color: kcolors.primary, fontSize: 12, fontWeight: FontWeight.w600),
  );
}

Text kTitleDetail(String text) {
  return Text(
    text,
    style: const TextStyle(color: kcolors.primary, fontSize: 18, fontWeight: FontWeight.w600),
  );
}
