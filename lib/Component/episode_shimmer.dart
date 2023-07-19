import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EpisodeShimmer extends StatelessWidget {
  const EpisodeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, mainAxisExtent: 40),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.grey.shade400,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
