import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;

class SynopsisShimmer extends StatelessWidget {
  const SynopsisShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade300,
          child: Container(
            decoration: const BoxDecoration(color: kcolors.bgSlate),
            width: double.infinity,
            height: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade300,
          child: Container(
            decoration: const BoxDecoration(color: kcolors.bgSlate),
            width: double.infinity,
            height: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade300,
          child: Container(
            decoration: const BoxDecoration(color: kcolors.bgSlate),
            width: double.infinity,
            height: 15,
          ),
        ),
      ],
    );
  }
}
