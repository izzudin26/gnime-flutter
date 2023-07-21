import 'package:flutter/material.dart';
import 'package:flutter_gogonime/Colors.dart' as kcolors;
import 'package:flutter_gogonime/Component/form.dart' as kform;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search Anime'),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: kcolors.bgSlate,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [kform.kTextField()],
        ),
      ),
    );
  }
}
