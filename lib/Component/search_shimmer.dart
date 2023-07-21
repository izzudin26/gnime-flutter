import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;

class SearchLoadingShimmer extends StatelessWidget {
  const SearchLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey.shade300,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcolors.bgSlate),
              width: 130,
              height: 180,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcolors.bgSlate),
                  width: double.infinity,
                  height: 25,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcolors.bgSlate),
                  width: 100,
                  height: 25,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
