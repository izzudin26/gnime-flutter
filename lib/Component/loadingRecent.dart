import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gogonime/Colors.dart' as colors;

class LoadingRecent extends StatelessWidget {
  const LoadingRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 6,
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 10 / 16, crossAxisSpacing: 10, mainAxisSpacing: 10),
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: colors.bgSlate,
          highlightColor: colors.slate600,
          child: Container(
            decoration: BoxDecoration(color: colors.slate600, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
