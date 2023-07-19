import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EpisodeShimmer extends StatelessWidget {
  const EpisodeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade400,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade400,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade400,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade400,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade400,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
