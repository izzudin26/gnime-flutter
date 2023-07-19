import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;

class BottomNavigation extends StatelessWidget {
  final List<Widget> children;
  const BottomNavigation({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        )).frosted(blur: 3, frostColor: kcolors.slate600, borderRadius: BorderRadius.circular(15));
  }
}
